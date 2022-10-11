// Generated by gencpp from file t4ac_msgs/Bounding_Box_3D_list.msg
// DO NOT EDIT!


#ifndef T4AC_MSGS_MESSAGE_BOUNDING_BOX_3D_LIST_H
#define T4AC_MSGS_MESSAGE_BOUNDING_BOX_3D_LIST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <t4ac_msgs/Bounding_Box_3D.h>

namespace t4ac_msgs
{
template <class ContainerAllocator>
struct Bounding_Box_3D_list_
{
  typedef Bounding_Box_3D_list_<ContainerAllocator> Type;

  Bounding_Box_3D_list_()
    : header()
    , bounding_box_3d_list()  {
    }
  Bounding_Box_3D_list_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , bounding_box_3d_list(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::t4ac_msgs::Bounding_Box_3D_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::t4ac_msgs::Bounding_Box_3D_<ContainerAllocator> >::other >  _bounding_box_3d_list_type;
  _bounding_box_3d_list_type bounding_box_3d_list;





  typedef boost::shared_ptr< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> const> ConstPtr;

}; // struct Bounding_Box_3D_list_

typedef ::t4ac_msgs::Bounding_Box_3D_list_<std::allocator<void> > Bounding_Box_3D_list;

typedef boost::shared_ptr< ::t4ac_msgs::Bounding_Box_3D_list > Bounding_Box_3D_listPtr;
typedef boost::shared_ptr< ::t4ac_msgs::Bounding_Box_3D_list const> Bounding_Box_3D_listConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator1> & lhs, const ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.bounding_box_3d_list == rhs.bounding_box_3d_list;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator1> & lhs, const ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace t4ac_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> >
{
  static const char* value()
  {
    return "68148d914255b67811779dc40b20532f";
  }

  static const char* value(const ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x68148d914255b678ULL;
  static const uint64_t static_value2 = 0x11779dc40b20532fULL;
};

template<class ContainerAllocator>
struct DataType< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> >
{
  static const char* value()
  {
    return "t4ac_msgs/Bounding_Box_3D_list";
  }

  static const char* value(const ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Techs4AgeCar project\n"
"\n"
"Header header                          # Frame and timestamp information\n"
"\n"
"Bounding_Box_3D[] bounding_box_3d_list # List of 3D Bounding Boxes \n"
"                                       # (may include their velocity)\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: t4ac_msgs/Bounding_Box_3D\n"
"# Techs4AgeCar project\n"
"\n"
"string                           type         # Object type\n"
"float64                          score        # Object probability (0 to 1)\n"
"\n"
"geometry_msgs/PoseWithCovariance pose         # Centroid x,y,z, yaw (Laser frame)\n"
"float64                          l            # Object length (Originally along x-laser frame)\n"
"float64                          w            # Object width (Originally along y-laser frame)\n"
"float64                          h            # Object height (z-laser frame)\n"
"Node[]                           corners_3d   # 3D bbox coordinates (x,y,z ; Laser frame)\n"
"float64                          vel_lin      # Absolute global linear velocity\n"
"float64                          vel_ang      # Absolute global angular velocity\n"
"\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/PoseWithCovariance\n"
"# This represents a pose in free space with uncertainty.\n"
"\n"
"Pose pose\n"
"\n"
"# Row-major representation of the 6x6 covariance matrix\n"
"# The orientation parameters use a fixed-axis representation.\n"
"# In order, the parameters are:\n"
"# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)\n"
"float64[36] covariance\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"\n"
"================================================================================\n"
"MSG: t4ac_msgs/Node\n"
"## Node definition \n"
"\n"
"float64 x	# X\n"
"float64 y	# Y\n"
"float64 z	# Z\n"
;
  }

  static const char* value(const ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.bounding_box_3d_list);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Bounding_Box_3D_list_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::t4ac_msgs::Bounding_Box_3D_list_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "bounding_box_3d_list[]" << std::endl;
    for (size_t i = 0; i < v.bounding_box_3d_list.size(); ++i)
    {
      s << indent << "  bounding_box_3d_list[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::t4ac_msgs::Bounding_Box_3D_<ContainerAllocator> >::stream(s, indent + "    ", v.bounding_box_3d_list[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // T4AC_MSGS_MESSAGE_BOUNDING_BOX_3D_LIST_H