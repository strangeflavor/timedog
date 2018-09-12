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

with(oConsole)
{
    ds_queue_enqueue(console_q,string(objectAge)+' '+string(_output));
    //truncate_console();
    while(ds_queue_size(console_q)>24)
        ds_queue_dequeue(console_q);
}

//show_message(argument0);

