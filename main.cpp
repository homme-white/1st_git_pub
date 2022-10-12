#include<opencv2/opencv.hpp>
#include<iostream>
#include<stdlib.h>
#include<string>
#include<vector>
#include<math.h>
using namespace cv;
using namespace std;
void  drawlight(Mat a,const RotatedRect &rotatedrect)
{
    Point2f p[4];
    rotatedrect.points(p);
    for(int i=0;i<4;i++)
    {
        line(a,p[i],p[(i+1)%4],Scalar(0,255,0),4,8,0);
    }

}
void  drawarmor(Mat a,const RotatedRect &rotatedrect)
{
    Point2f p[4];
    rotatedrect.points(p);
    for(int i=0;i<4;i++)
    {
        line(a,p[i],p[(i+1)%4],Scalar(255,0,0),4,8,0);
    }
    circle(a,rotatedrect.center,5,Scalar(0,255,255),3);

}
float distance(Point2f a,Point2f b)
{
    return sqrt((a.x-b.x)*(a.x-b.x)+(a.y-b.y)*(a.y-b.y));
}
int main()
{
    VideoCapture myvideo("/home/homie/t_dt/Infantry_red.avi");
    if(myvideo.isOpened()==0)
    {
        cout<<"请确认视频文件名称是否正确"<<endl;
        return -1;
    }
    while(myvideo.isOpened())
    {
        Mat img,gray;
        vector<vector<Point> > Contours;
        myvideo>>img;
        cvtColor(img , gray , COLOR_BGR2GRAY);
        threshold(gray,gray,110,255,THRESH_BINARY);
        Mat element = cv::getStructuringElement(cv::MORPH_ELLIPSE, cv::Size(2, 2));
        dilate(gray,gray,element,Point(-1,-1),4);
        findContours(gray,Contours,0,2);
        vector<RotatedRect> light;
        for(size_t i = 0; i < Contours.size();i++)
        {
            if(Contours[i].size()<5)continue;
            if(contourArea(Contours[i])<175||contourArea(Contours[i])>1300)continue;
            RotatedRect Rec =fitEllipse(Contours[i]);
            if(Rec.size.width/Rec.size.height>0.28||contourArea(Contours[i])/Rec.size.area()<0.3)continue;
            light.push_back(Rec);
            drawlight(img,Rec);
        }
        sort(light.begin(),light.end(), [](const RotatedRect& l1, const RotatedRect& l2)
        {
            return l1.center.x < l2.center.x;
        });
        for(size_t i=0;i<light.size();i++)
        {
            for(size_t j=i+1;j<light.size();j++)
            {
                Point2f Rc;
                Size2f Rs;
                float Ra;
                const RotatedRect& left =light[i];
                const RotatedRect& right =light[j];
                float angle=abs(left.angle-right.angle);
                float heightrate=abs(left.size.height-right.size.height)/max(left.size.height,right.size.height);
                if(angle>10||heightrate>0.4)continue;
                float dis=distance(left.center,right.center);
                float avelen=(left.size.height+right.size.height)/2;
                float yrate=abs(left.center.y-right.center.y)/avelen;
                float xrate=abs(left.center.x-right.center.x)/avelen;
                float disrate=dis/avelen;
                if(yrate>0.5||disrate>3||disrate<0.5)continue;
                Rc=(left.center+right.center)/2;
                Rs.height=2*avelen;
                Rs.width=dis*0.88;
                Ra=(left.angle+right.angle)/2;
                RotatedRect armor(Rc,Rs,Ra); 
                drawarmor(img,armor);
            }
        }
        double fps=myvideo.get(CAP_PROP_FPS);
        stringstream a;
        a<<"FPS:"<<fps;
        putText(img,a.str(),Point(1150,60),FONT_HERSHEY_SIMPLEX,1.5,Scalar(255,255,255),2);
        imshow("origin",img);
        waitKey(1000/myvideo.get(CAP_PROP_FPS));
    }
}
