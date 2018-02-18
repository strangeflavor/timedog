#define make
///make(x,y,object_index)
var _instanceID;
if argument_count == 1 or argument_count == 2 _instanceID = instance_create(x,y,argument[0]);
if argument_count >= 3 _instanceID = instance_create(argument[0],argument[1],argument[2]);
return _instanceID;

#define kill
with argument0 instance_destroy();
#define select
/// select(index, ...values)
return argument[argument[0] + 1];
