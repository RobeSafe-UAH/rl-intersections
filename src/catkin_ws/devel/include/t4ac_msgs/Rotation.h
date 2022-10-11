// Generated by gencpp from file t4ac_msgs/Rotation.msg
// DO NOT EDIT!


#ifndef T4AC_MSGS_MESSAGE_ROTATION_H
#define T4AC_MSGS_MESSAGE_ROTATION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace t4ac_msgs
{
template <class ContainerAllocator>
struct Rotation_
{
  typedef Rotation_<ContainerAllocator> Type;

  Rotation_()
    : pitch(0.0)
    , yaw(0.0)
    , roll(0.0)  {
    }
  Rotation_(const ContainerAllocator& _alloc)
    : pitch(0.0)
    , yaw(0.0)
    , roll(0.0)  {
  (void)_alloc;
    }



   typedef double _pitch_type;
  _pitch_type pitch;

   typedef double _yaw_type;
  _yaw_type yaw;

   typedef double _roll_type;
  _roll_type roll;





  typedef boost::shared_ptr< ::t4ac_msgs::Rotation_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::t4ac_msgs::Rotation_<ContainerAllocator> const> ConstPtr;

}; // struct Rotation_

typedef ::t4ac_msgs::Rotation_<std::allocator<void> > Rotation;

typedef boost::shared_ptr< ::t4ac_msgs::Rotation > RotationPtr;
typedef boost::shared_ptr< ::t4ac_msgs::Rotation const> RotationConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::t4ac_msgs::Rotation_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::t4ac_msgs::Rotation_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::t4ac_msgs::Rotation_<ContainerAllocator1> & lhs, const ::t4ac_msgs::Rotation_<ContainerAllocator2> & rhs)
{
  return lhs.pitch == rhs.pitch &&
    lhs.yaw == rhs.yaw &&
    lhs.roll == rhs.roll;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::t4ac_msgs::Rotation_<ContainerAllocator1> & lhs, const ::t4ac_msgs::Rotation_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace t4ac_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::t4ac_msgs::Rotation_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::t4ac_msgs::Rotation_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::t4ac_msgs::Rotation_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::t4ac_msgs::Rotation_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::t4ac_msgs::Rotation_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::t4ac_msgs::Rotation_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::t4ac_msgs::Rotation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6b33b81f528b84606cf372e61b6ef5ea";
  }

  static const char* value(const ::t4ac_msgs::Rotation_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6b33b81f528b8460ULL;
  static const uint64_t static_value2 = 0x6cf372e61b6ef5eaULL;
};

template<class ContainerAllocator>
struct DataType< ::t4ac_msgs::Rotation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "t4ac_msgs/Rotation";
  }

  static const char* value(const ::t4ac_msgs::Rotation_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::t4ac_msgs::Rotation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# T4ac Project \n"
"\n"
"float64 pitch\n"
"float64 yaw\n"
"float64 roll\n"
;
  }

  static const char* value(const ::t4ac_msgs::Rotation_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::t4ac_msgs::Rotation_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pitch);
      stream.next(m.yaw);
      stream.next(m.roll);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Rotation_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::t4ac_msgs::Rotation_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::t4ac_msgs::Rotation_<ContainerAllocator>& v)
  {
    s << indent << "pitch: ";
    Printer<double>::stream(s, indent + "  ", v.pitch);
    s << indent << "yaw: ";
    Printer<double>::stream(s, indent + "  ", v.yaw);
    s << indent << "roll: ";
    Printer<double>::stream(s, indent + "  ", v.roll);
  }
};

} // namespace message_operations
} // namespace ros

#endif // T4AC_MSGS_MESSAGE_ROTATION_H
