// Generated by gencpp from file ur10_mover/StateServiceResponse.msg
// DO NOT EDIT!


#ifndef UR10_MOVER_MESSAGE_STATESERVICERESPONSE_H
#define UR10_MOVER_MESSAGE_STATESERVICERESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ur10_mover
{
template <class ContainerAllocator>
struct StateServiceResponse_
{
  typedef StateServiceResponse_<ContainerAllocator> Type;

  StateServiceResponse_()
    : output_msg()
    , current_joint_angles()  {
      current_joint_angles.assign(0.0);
  }
  StateServiceResponse_(const ContainerAllocator& _alloc)
    : output_msg(_alloc)
    , current_joint_angles()  {
  (void)_alloc;
      current_joint_angles.assign(0.0);
  }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _output_msg_type;
  _output_msg_type output_msg;

   typedef boost::array<double, 6>  _current_joint_angles_type;
  _current_joint_angles_type current_joint_angles;





  typedef boost::shared_ptr< ::ur10_mover::StateServiceResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ur10_mover::StateServiceResponse_<ContainerAllocator> const> ConstPtr;

}; // struct StateServiceResponse_

typedef ::ur10_mover::StateServiceResponse_<std::allocator<void> > StateServiceResponse;

typedef boost::shared_ptr< ::ur10_mover::StateServiceResponse > StateServiceResponsePtr;
typedef boost::shared_ptr< ::ur10_mover::StateServiceResponse const> StateServiceResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ur10_mover::StateServiceResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ur10_mover::StateServiceResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ur10_mover::StateServiceResponse_<ContainerAllocator1> & lhs, const ::ur10_mover::StateServiceResponse_<ContainerAllocator2> & rhs)
{
  return lhs.output_msg == rhs.output_msg &&
    lhs.current_joint_angles == rhs.current_joint_angles;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ur10_mover::StateServiceResponse_<ContainerAllocator1> & lhs, const ::ur10_mover::StateServiceResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ur10_mover

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ur10_mover::StateServiceResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ur10_mover::StateServiceResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ur10_mover::StateServiceResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ur10_mover::StateServiceResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ur10_mover::StateServiceResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ur10_mover::StateServiceResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ur10_mover::StateServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9e7aee8efb870b0111c155e8c0755e88";
  }

  static const char* value(const ::ur10_mover::StateServiceResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9e7aee8efb870b01ULL;
  static const uint64_t static_value2 = 0x11c155e8c0755e88ULL;
};

template<class ContainerAllocator>
struct DataType< ::ur10_mover::StateServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ur10_mover/StateServiceResponse";
  }

  static const char* value(const ::ur10_mover::StateServiceResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ur10_mover::StateServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string output_msg\n"
"float64[6] current_joint_angles\n"
;
  }

  static const char* value(const ::ur10_mover::StateServiceResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ur10_mover::StateServiceResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.output_msg);
      stream.next(m.current_joint_angles);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct StateServiceResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ur10_mover::StateServiceResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ur10_mover::StateServiceResponse_<ContainerAllocator>& v)
  {
    s << indent << "output_msg: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.output_msg);
    s << indent << "current_joint_angles[]" << std::endl;
    for (size_t i = 0; i < v.current_joint_angles.size(); ++i)
    {
      s << indent << "  current_joint_angles[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.current_joint_angles[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // UR10_MOVER_MESSAGE_STATESERVICERESPONSE_H
