pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Tracked;

procedure Tests is
begin
   Tracked.Reset_Counts;

   declare
      H : constant Tracked.Handle := Tracked.Make (5);
   begin
      Assert (Tracked.Id_Of (H) = 5);
      Assert (Tracked.Is_Live (H));
      Assert (Tracked.Initialize_Count >= 1);
   end;
   --  H finalized on block exit
   Assert (Tracked.Finalize_Count >= 1);
   Put_Line ("PASS Initialize + Finalize on scope exit");

   Tracked.Reset_Counts;
   declare
      A : constant Tracked.Handle := Tracked.Make (1);
      B : Tracked.Handle;
   begin
      B := A;  --  triggers Adjust on B
      Assert (Tracked.Adjust_Count >= 1);
      Assert (Tracked.Id_Of (B) = 1);
   end;
   Put_Line ("PASS Adjust on assignment");

   Put_Line ("All Controlled Types topic tests passed.");
end Tests;
