var i, arg;
for (i = 0; i < 16; i += 1;)
   {
   if argument_count > i
      {
      arg[i] = string(argument[i]);
      }
   else
      {
      arg[i] = '';
      }
   }

var _output = '';
for (i=0;i<16;i+=1) {
    if arg[i] != '' _output += ', '+arg[i];
}

_output = string_copy(_output,3,string_length(_output));
show_message(_output);
