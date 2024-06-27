// Generated by gencpp from file ur10_mover/StateServiceRequest.msg
// DO NOT EDIT!


#ifndef UR10_MOVER_MESSAGE_STATESERVICEREQUEST_H
#define UR10_MOVER_MESSAGE_STATESERVICEREQUEST_H


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
struct StateServiceRequest_
{
  typedef StateServiceRequest_<ContainerAllocator> Type;

  StateServiceRequest_()
    : input_msg()  {
    }
  StateServiceRequest_(const ContainerAllocator& _alloc)
    : input_msg(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _input_msg_type;
  _input_msg_type input_msg;





  typedef boost::shared_ptr< ::ur10_mover::StateServiceRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ur10_mover::StateServiceRequest_<ContainerAllocator> const> ConstPtr;

}; // struct StateServiceRequest_

typedef ::ur10_mover::StateServiceRequest_<std::allocator<void> > StateServiceRequest;

typedef boost::shared_ptr< ::ur10_mover::StateServiceRequest > StateServiceRequestPtr;
typedef boost::shared_ptr< ::ur10_mover::StateServiceRequest const> StateServiceRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ur10_mover::StateServiceRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ur10_mover::StateServiceRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ur10_mover::StateServiceRequest_<ContainerAllocator1> & lhs, const ::ur10_mover::StateServiceRequest_<ContainerAllocator2> & rhs)
{
  return lhs.input_msg == rhs.input_msg;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ur10_mover::StateServiceRequest_<ContainerAllocator1> & lhs, const ::ur10_mover::StateServiceRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ur10_mover

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ur10_mover::StateServiceRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ur10_mover::StateServiceRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ur10_mover::StateServiceRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ur10_mover::StateServiceRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ur10_mover::StateServiceRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ur10_mover::StateServiceRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ur10_mover::StateServiceRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2beecd7d8a70aad2184c84345d0cd8d3";
  }

  static const char* value(const ::ur10_mover::StateServiceRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2beecd7d8a70aad2ULL;
  static const uint64_t static_value2 = 0x184c84345d0cd8d3ULL;
};

template<class ContainerAllocator>
struct DataType< ::ur10_mover::StateServiceRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ur10_mover/StateServiceRequest";
  }

  static const char* value(const ::ur10_mover::StateServiceRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ur10_mover::StateServiceRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string input_msg\n"
;
  }

  static const char* value(const ::ur10_mover::StateServiceRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ur10_mover::StateServiceRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.input_msg);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct StateServiceRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ur10_mover::StateServiceRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ur10_mover::StateServiceRequest_<ContainerAllocator>& v)
  {
    s << indent << "input_msg: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.input_msg);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UR10_MOVER_MESSAGE_STATESERVICEREQUEST_H
