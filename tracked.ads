--  Ada 2022 topic: Controlled types (Initialize / Adjust / Finalize).
pragma Ada_2022;

with Ada.Finalization;

package Tracked is

   --  Observable counters for demos/tests (not task-safe; single-task sheet).
   Initialize_Count : Natural := 0;
   Adjust_Count     : Natural := 0;
   Finalize_Count   : Natural := 0;

   procedure Reset_Counts;

   type Handle is new Ada.Finalization.Controlled with private;

   function Make (Id : Positive) return Handle;
   function Id_Of (H : Handle) return Natural;
   function Is_Live (H : Handle) return Boolean;

private

   type Handle is new Ada.Finalization.Controlled with record
      Id   : Natural := 0;
      Live : Boolean := False;
   end record;

   overriding procedure Initialize (Object : in out Handle);
   overriding procedure Adjust (Object : in out Handle);
   overriding procedure Finalize (Object : in out Handle);

end Tracked;
