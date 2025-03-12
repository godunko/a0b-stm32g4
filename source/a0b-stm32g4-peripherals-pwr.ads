--
--  Copyright (C) 2025, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  Common definitions for STM32G4xx family [RM0440]
--
--  PWR: Power control

pragma Ada_2022;

with System.Storage_Elements;

with A0B.Types;

package A0B.STM32G4.Peripherals.PWR
  with Preelaborate, No_Elaboration_Code_All
is

   PWR_Base_Address : constant := 16#4000_7000#;
   PWR_CR1_Offset   : constant := 16#00#;
   PWR_CR2_Offset   : constant := 16#04#;
   PWR_CR3_Offset   : constant := 16#08#;
   PWR_CR4_Offset   : constant := 16#0C#;
   PWR_SR1_Offset   : constant := 16#10#;
   PWR_SR2_Offset   : constant := 16#14#;
   PWR_CR5_Offset   : constant := 16#80#;
   --  FSF GCC 14 is unable to evaluate register's address at compile time
   --  and it use objects for constants allocated in RAM to store registers'
   --  addresses. These constants should be initialized at elaboration, but
   --  elaboration is disabled for this compilation unit. Named constants
   --  for addresses and offsets are used to workaround this issue.

   -------------
   -- PWR_CR1 --
   -------------

   type PWR_CR1_LPMS_Field is
     (Stop_0,
      Stop_1,
      Reserved_010,
      Standby,
      Shutdown,
      Shutdown_101,
      Shutdown_110,
      Shutdown_111) with Size => 3;

   type PWR_CR1_VOS_Field is
     (Reserved_00,
      Range_1,
      Range_2,
      Reserved_11) with Size => 2;

   type PWR_CR1_Register is record
      LPMS           : PWR_CR1_LPMS_Field;
      Reserved_3_7   : A0B.Types.Reserved_5;
      DBP            : Boolean;
      VOS            : PWR_CR1_VOS_Field;
      Reserved_11_13 : A0B.Types.Reserved_3;
      LPR            : Boolean;
      Reserved_15_31 : A0B.Types.Reserved_17;
   end record with Size => 32;

   for PWR_CR1_Register use record
      LPMS           at 0 range 0 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      DBP            at 0 range 8 .. 8;
      VOS            at 0 range 9 .. 10;
      Reserved_11_13 at 0 range 11 .. 13;
      LPR            at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   -------------
   -- PWR_CR2 --
   -------------

   type PWR_CR2_Register is record
      PVDE          : Boolean;
      PLS           : A0B.Types.Unsigned_3;
      Reserved_4_5  : A0B.Types.Reserved_2;
      PVME1         : Boolean;
      PVME2         : Boolean;
      Reserved_8_31 : A0B.Types.Reserved_24;
   end record with Size => 32;

   for PWR_CR2_Register use record
      PVDE          at 0 range 0 .. 0;
      PLS           at 0 range 1 .. 3;
      Reserved_4_5  at 0 range 4 .. 5;
      PVME1         at 0 range 6 .. 6;
      PVME2         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -------------
   -- PWR_CR3 --
   -------------

   type PWR_CR3_Register is record
      EWUP1          : Boolean;
      EWUP2          : Boolean;
      EWUP3          : Boolean;
      EWUP4          : Boolean;
      EWUP5          : Boolean;
      Reserved_5_7   : A0B.Types.Reserved_3;
      RRS            : Boolean;
      Reserved_9     : A0B.Types.Reserved_1;
      APC            : Boolean;
      Reserved_11_12 : A0B.Types.Reserved_2;
      UCPD1_STDBY    : Boolean;
      UCPD1_DBDIS    : Boolean;
      EIWUL          : Boolean;
      Reserved_16_31 : A0B.Types.Reserved_16;
   end record with Size => 32;

   for PWR_CR3_Register use record
      EWUP1          at 0 range 0 .. 0;
      EWUP2          at 0 range 1 .. 1;
      EWUP3          at 0 range 2 .. 2;
      EWUP4          at 0 range 3 .. 3;
      EWUP5          at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      RRS            at 0 range 8 .. 8;
      Reserved_9     at 0 range 9 .. 9;
      APC            at 0 range 10 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      UCPD1_STDBY    at 0 range 13 .. 13;
      UCPD1_DBDIS    at 0 range 14 .. 14;
      EIWUL          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------
   -- PWR_CR4 --
   -------------

   type PWR_CR4_Register is record
      WP1            : Boolean;
      WP2            : Boolean;
      WP3            : Boolean;
      WP4            : Boolean;
      WP5            : Boolean;
      Reserved_5_7   : A0B.Types.Reserved_3;
      VBE            : Boolean;
      VBRS           : Boolean;
      Reserved_10_31 : A0B.Types.Reserved_22;
   end record with Size => 32;

   for PWR_CR4_Register use record
      WP1            at 0 range 0 .. 0;
      WP2            at 0 range 1 .. 1;
      WP3            at 0 range 2 .. 2;
      WP4            at 0 range 3 .. 3;
      WP5            at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      VBE            at 0 range 8 .. 8;
      VBRS           at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -------------
   -- PWR_CR5 --
   -------------

   type PWR_CR5_Register is record
      Reserved_0_7  : A0B.Types.Reserved_8;
      R1MODE        : Boolean;
      Reserved_9_31 : A0B.Types.Reserved_23;
   end record with Size => 32;

   for PWR_CR5_Register use record
      Reserved_0_7  at 0 range 0 .. 7;
      R1MODE        at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -------------
   -- PWR_SR1 --
   -------------

   type PWR_SR1_Register is record
      WUF1           : Boolean;
      WUF2           : Boolean;
      WUF3           : Boolean;
      WUF4           : Boolean;
      WUF5           : Boolean;
      Reserved_5_7   : A0B.Types.Reserved_3;
      SBF            : Boolean;
      Reserved_9_14  : A0B.Types.Reserved_6;
      WUFI           : Boolean;
      Reserved_16_31 : A0B.Types.Reserved_16;
   end record with Size => 32;

   for PWR_SR1_Register use record
      WUF1           at 0 range 0 .. 0;
      WUF2           at 0 range 1 .. 1;
      WUF3           at 0 range 2 .. 2;
      WUF4           at 0 range 3 .. 3;
      WUF5           at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      SBF            at 0 range 8 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      WUFI           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------
   -- PWR_SR2 --
   -------------

   type PWR_SR2_Register is record
      Reserved_0_6   : A0B.Types.Reserved_7;
      FLASH_RDY      : Boolean;
      REGLPS         : Boolean;
      REGLPF         : Boolean;
      VOSF           : Boolean;
      PVDO           : Boolean;
      Reserved_12_13 : A0B.Types.Reserved_2;
      PVMO1          : Boolean;
      PVMO2          : Boolean;
      Reserved_16_31 : A0B.Types.Reserved_16;
   end record with Size => 32;

   for PWR_SR2_Register use record
      Reserved_0_6   at 0 range 0 .. 6;
      FLASH_RDY      at 0 range 7 .. 7;
      REGLPS         at 0 range 8 .. 8;
      REGLPF         at 0 range 9 .. 9;
      VOSF           at 0 range 10 .. 10;
      PVDO           at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      PVMO1          at 0 range 14 .. 14;
      PVMO2          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   use System.Storage_Elements;

   PWR_CR1 : PWR_CR1_Register
     with Import, Volatile, Full_Access_Only,
          Address => To_Address (PWR_Base_Address + PWR_CR1_Offset);
   PWR_CR2 : PWR_CR2_Register
     with Import, Volatile, Full_Access_Only,
          Address => To_Address (PWR_Base_Address + PWR_CR2_Offset);
   PWR_CR3 : PWR_CR3_Register
     with Import, Volatile, Full_Access_Only,
          Address => To_Address (PWR_Base_Address + PWR_CR3_Offset);
   PWR_CR4 : PWR_CR4_Register
     with Import, Volatile, Full_Access_Only,
          Address => To_Address (PWR_Base_Address + PWR_CR4_Offset);
   PWR_SR1 : PWR_SR1_Register
     with Import, Volatile, Full_Access_Only,
          Address => To_Address (PWR_Base_Address + PWR_SR1_Offset);
   PWR_SR2 : PWR_SR2_Register
     with Import, Volatile, Full_Access_Only,
          Address => To_Address (PWR_Base_Address + PWR_SR2_Offset);
   PWR_CR5 : PWR_CR5_Register
     with Import, Volatile, Full_Access_Only,
          Address => To_Address (PWR_Base_Address + PWR_CR5_Offset);

end A0B.STM32G4.Peripherals.PWR;
