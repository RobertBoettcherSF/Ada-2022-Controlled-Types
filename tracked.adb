pragma Ada_2022;

package body Tracked is

   procedure Reset_Counts is
   begin
      Initialize_Count := 0;
      Adjust_Count := 0;
      Finalize_Count := 0;
   end Reset_Counts;

   procedure Initialize (Object : in out Handle) is
   begin
      Initialize_Count := Initialize_Count + 1;
      Object.Live := True;
      --  Id left 0 until Make / assignment fills it.
   end Initialize;

   procedure Adjust (Object : in out Handle) is
   begin
      Adjust_Count := Adjust_Count + 1;
      --  After bitwise copy, Adjust runs on the target; treat as a new live
      --  logical owner (still shares Id for this teaching example).
      Object.Live := True;
   end Adjust;

   procedure Finalize (Object : in out Handle) is
   begin
      if Object.Live then
         Finalize_Count := Finalize_Count + 1;
         Object.Live := False;
         Object.Id := 0;
      end if;
   end Finalize;

   function Make (Id : Positive) return Handle is
      H : Handle;
   begin
      H.Id := Id;
      return H;
   end Make;

   function Id_Of (H : Handle) return Natural is
   begin
      return H.Id;
   end Id_Of;

   function Is_Live (H : Handle) return Boolean is
   begin
      return H.Live;
   end Is_Live;

end Tracked;
