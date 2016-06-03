import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;
KJoint[] joints;

int trailingJointIndex;
ArrayList<KSkeleton> skeletonArray = new ArrayList<KSkeleton>();
ArrayList<PVector> trailingJointPositions = new ArrayList<PVector>();

float kinectScaling = 500.0;