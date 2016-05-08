import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;
KJoint[] joints;

int trailingJointIndex;
ArrayList<KSkeleton> skeletonArray = new ArrayList<KSkeleton>();
ArrayList<PVector> trailingJointPositions = new ArrayList<PVector>();

//float kinectScaling = 200.0;
//scaling for full screen
float kinectScaling = 400.0;

//number of skeletons tracked
int skeletonsTracked;