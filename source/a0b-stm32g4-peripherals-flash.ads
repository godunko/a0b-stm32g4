--
--  Copyright (C) 2025, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  Common definitions for STM32G4xx family [RM0440]
--
--  FLASH: Embedded flash memory (common definitions for category 2/3/4)

with System.Storage_Elements;

with A0B.Types;

package A0B.STM32G4.Peripherals.FLASH
  with Preelaborate, No_Elaboration_Code_All
is

   FLASH_Base_Address : constant := 16#4002_2000#;
   FLASH_ACR_Offset   : constant := 16#00#;
   --  FSF GCC 14 is unable to evaluate register's address at compile time
   --  and it use objects for constants allocated in RAM to store registers'
   --  addresses. These constants should be initialized at elaboration, but
   --  elaboration is disabled for this compilation unit. Named constants
   --  for addresses and offsets are used to workaround this issue.

   ---------------
   -- FLASH_ACR --
   ---------------

   type FLASH_ACR_Register is record
      LATENCY        : A0B.Types.Unsigned_4;
      Reserved_4_7   : A0B.Types.Reserved_4;
      PRFTEN         : Boolean;
      ICEN           : Boolean;
      DCEN           : Boolean;
      ICRST          : Boolean;
      DCRST          : Boolean;
      RUN_PD         : Boolean;
      SLEEP_PD       : Boolean;
      Reserved_15_17 : A0B.Types.Reserved_3;
      DBG_SWEN       : Boolean;
      Reserved_19_31 : A0B.Types.Reserved_13;
   end record with Size => 32;

   for FLASH_ACR_Register use record
      LATENCY        at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      PRFTEN         at 0 range 8 .. 8;
      ICEN           at 0 range 9 .. 9;
      DCEN           at 0 range 10 .. 10;
      ICRST          at 0 range 11 .. 11;
      DCRST          at 0 range 12 .. 12;
      RUN_PD         at 0 range 13 .. 13;
      SLEEP_PD       at 0 range 14 .. 14;
      Reserved_15_17 at 0 range 15 .. 17;
      DBG_SWEN       at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   use System.Storage_Elements;

   FLASH_ACR : FLASH_ACR_Register
     with Import, Volatile,
          Address => To_Address (FLASH_Base_Address + FLASH_ACR_Offset);

end A0B.STM32G4.Peripherals.FLASH;
