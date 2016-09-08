//10 joints being tracked on kinect
//0: Head;
//1: SpineBase;
//2: KneeLeft;
//3: KneeRight;
//4: WristLeft;
//5: WristRight;
//6: HandTipLeft
//7: HandTipRight
//8: ThumbLeft
//9: ThumbRight

//import libraries for kinect2
import KinectPV2.KJoint;
import KinectPV2.*;

//declare new kinect object
KinectPV2 kinect;

//declare new array for joints
KJoint[] joints;

//declare new int for index of current joint
int trailingJointIndex;

//declare array for storing the skeletons
ArrayList<KSkeleton> skeletonArray = new ArrayList<KSkeleton>();

//number of skeletons being tracked
int skeletonsTracked;

//declare array for storing the joint positions
ArrayList<PVector> trailingJointPositions = new ArrayList<PVector>();

//number of joints tracked by kinect
int jointsNum = 10;

// factor for scaling measures
int kinectScaling = 500;

//function for setting up the kinect
void setupKinect() {
  //constructor method of KinectPV2 class
  kinect = new KinectPV2(this);
  //enable 3D skeleton
  kinect.enableSkeleton3DMap(true);
  //initialize the streaming of data
  kinect.init();
}

//get data from Kinect
void getKinectData() {

  //translate coordinate system
  pushMatrix();
  translate(width/2, height/2, 0);
  //scale measures
  scale(kinectScaling, kinectScaling, 1);
  //rotate
  rotateX(PI);
  //flip the x positions, so we can perform in between the Kinect and the wall
 // rotateY(PI);

  //retrieve the skeleton data
  skeletonArray = kinect.getSkeleton3d();
  
  //if there are skeletons tracked
  
  skeletonsTracked = skeletonArray.size();
  
  if (skeletonsTracked > 0) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(0);
    if (skeleton.isTracked()) {
      
      //get the joints from the skeleton
      joints = skeleton.getJoints();

      //keep only the current frame of joints in storage
      while (trailingJointPositions.size()>0) {
        trailingJointPositions.remove(0);
      }
      // Get the index number for the joint
      //each index represents one joint
      for (int i = 0; i<jointsNum; i++) {
        // Retrieve the joint using the index number
        KJoint trailingJoint = joints[getTrailingJointIndex(i)];
        // Get the PVector containing the xyz position of the joint
        trailingJointPositions.add(trailingJoint.getPosition().copy());
      }
      
      println("left hand = "+trailingJointPositions.get(4));
    }
  }
  popMatrix();
}

//function for retrieveing index of
//joints according to kinect library
int getTrailingJointIndex(int index) {

  if (index == 0) {
    return KinectPV2.JointType_Head;
  } else if (index == 1) {
    return KinectPV2.JointType_SpineBase;
  } else if (index == 2) {
    return KinectPV2.JointType_KneeLeft;
  } else if (index == 3) {
    return KinectPV2.JointType_KneeRight;
  } else if (index == 4) {   
    return KinectPV2.JointType_WristLeft;
  } else if (index == 5) {
    return KinectPV2.JointType_WristRight;
  } else if (index == 6) {
    return KinectPV2.JointType_HandTipLeft;
  } else if (index == 7) {
    return KinectPV2.JointType_HandTipRight;
  } else if (index == 8) {
    return KinectPV2.JointType_ThumbLeft;
  } else if (index == 9) {
    return KinectPV2.JointType_ThumbRight;
  } else {
    return 1000;
  }
}