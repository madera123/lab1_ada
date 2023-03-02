with Ada.Text_IO;
procedure Main is

   can_stop : boolean := false;
   pragma Atomic(can_stop);
   coll_thread : Integer;

   task type break_thread;
   task type main_thread;

   task body break_thread is
      time:Duration:=5.0;
   begin
      delay time;
      can_stop := true;
   end break_thread;

   task body main_thread is
      step:Long_Long_Integer:=2;
      col :Long_Long_Integer:=0;
      sum : Long_Long_Integer := 0;
   begin
      loop
         col := col + 1;
         sum:= sum + col*step;
         exit when can_stop;
      end loop;
      Ada.Text_IO.Put_Line("col- " & col'Img & " sum- " & sum'Img);
   end main_thread;

   b1 : break_thread;
begin
   coll_thread:= 5;
   declare
      A: Array(1..coll_thread) of main_thread;
   begin
      null;
   End;
end Main;
