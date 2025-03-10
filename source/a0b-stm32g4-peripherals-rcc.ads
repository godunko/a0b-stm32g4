--
--  Copyright (C) 2025, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  Common definitions for STM32G4xx family [RM0440]
--
--  RCC: Reset and clock control

pragma Ada_2022;

with System.Storage_Elements;

with A0B.Types;

package A0B.STM32G4.Peripherals.RCC
  with Preelaborate, No_Elaboration_Code_All
is

   use type System.Storage_Elements.Integer_Address;

   RCC_Base_Address   : constant := 16#4002_1000#;
   RCC_CR_Offset      : constant := 16#00#;
   RCC_CFGR_Offset    : constant := 16#08#;
   RCC_PLLCFGR_Offset : constant := 16#0C#;
   --  FSF GCC 14 is unable to evaluate register's addresses in compiler time
   --  and use objects allocated in RAM to store addresses registers.

   --------------
   -- RCC_CFGR --
   --------------

   type RCC_CFGR_SW_Field is (Reserved_00, HSI16, HSE, PLL);

   type RCC_CFGR_HPRE_Field is
     (SYSCLK_1,
      Reserved_0001,
      Reserved_0010,
      Reserved_0011,
      Reserved_0100,
      Reserved_0101,
      Reserved_0110,
      Reserved_0111,
      SYSCLK_2,
      SYSCLK_4,
      SYSCLK_8,
      SYSCLK_16,
      SYSCLK_64,
      SYSCLK_128,
      SYSCLK_256,
      SYSCLK_512) with Size => 4;

   type RCC_CFGR_PPRE1_Field is
     (HCLK_1,
      Reserved_001,
      Reserved_010,
      Reserved_011,
      HCLK_2,
      HCLK_4,
      HCLK_8,
      HCLK_16) with Size => 3;

   type RCC_CFGR_PPRE2_Field is
     (HCLK_1,
      Reserved_001,
      Reserved_010,
      Reserved_011,
      HCLK_2,
      HCLK_4,
      HCLK_8,
      HCLK_16) with Size => 3;

   type RCC_CFGR_MCOSEL_Field is
     (Disabled,
      SYSCLK,
      Reserved_0010,
      HSI16,
      HSE,
      PLL,
      LSI,
      LSE,
      HSI48) with Size => 4;

   type RCC_CFGR_MCOPRE_Field is
     (MCO_1,
      MCO_2,
      MCO_4,
      MCO_8,
      MCO_16,
      Reserved_101,
      Reserved_110,
      Reserved_111) with Size => 4;

   type RCC_CFGR_Regiter is record
      SW             : RCC_CFGR_SW_Field;
      SWS            : RCC_CFGR_SW_Field;
      HPRE           : RCC_CFGR_HPRE_Field;
      PPRE1          : RCC_CFGR_PPRE1_Field;
      PPRE2          : RCC_CFGR_PPRE2_Field;
      Reserved_14_23 : A0B.Types.Reserved_10;
      MCOSEL         : RCC_CFGR_MCOSEL_Field;
      MCOPRE         : RCC_CFGR_MCOPRE_Field;
   end record with Size => 32;

   for RCC_CFGR_Regiter use record
      SW             at 0 range 0 .. 1;
      SWS            at 0 range 2 .. 3;
      HPRE           at 0 range 4 .. 7;
      PPRE1          at 0 range 8 .. 10;
      PPRE2          at 0 range 11 .. 13;
      Reserved_14_23 at 0 range 14 .. 23;
      MCOSEL         at 0 range 24 .. 27;
      MCOPRE         at 0 range 28 .. 31;
   end record;

   ------------
   -- RCC_CR --
   ------------

   type RCC_CR_Register is record
      Reserved_0_7   : A0B.Types.Reserved_8;
      HSION          : Boolean;
      HSIKERON       : Boolean;
      HSIRDY         : Boolean;
      Reserved_11_15 : A0B.Types.Reserved_5;
      HSEON          : Boolean;
      HSERDY         : Boolean;
      HSEBYP         : Boolean;
      CSSON          : Boolean;
      Reserved_20_23 : A0B.Types.Reserved_4;
      PLLON          : Boolean;
      PLLRDY         : Boolean;
      Reserved_26_31 : A0B.Types.Reserved_6;
   end record with Size => 32;

   for RCC_CR_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      HSION          at 0 range 8 .. 8;
      HSIKERON       at 0 range 9 .. 9;
      HSIRDY         at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      HSEON          at 0 range 16 .. 16;
      HSERDY         at 0 range 17 .. 17;
      HSEBYP         at 0 range 18 .. 18;
      CSSON          at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      PLLON          at 0 range 24 .. 24;
      PLLRDY         at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   -----------------
   -- RCC_PLLCFGR --
   -----------------

   type RCC_PLLCFGR_PLLSRC_Field is (No, Reserved_01, HSI16, HSE)
     with Size => 2;

   type RCC_PLLCFGR_PLLP_Field is (PLLP_7, PLLP_17) with Size => 1;

   type RCC_PLLCFGR_PLLQ_Field is (PLLQ_2, PLLQ_4, PLLQ_6, PLLQ_8)
     with Size => 2;

   type RCC_PLLCFGR_PLLR_Field is (PLLR_2, PLLR_4, PLLR_6, PLLR_8)
     with Size => 2;

   type RCC_PLLCFGR_Register is record
      PLLSRC         : RCC_PLLCFGR_PLLSRC_Field;
      Reserved_2_3   : A0B.Types.Reserved_2;
      PLLM           : A0B.Types.Unsigned_4;
      PLLN           : A0B.Types.Unsigned_7;
      Reserved_15    : A0B.Types.Reserved_1;
      PLLPEN         : Boolean;
      PLLP           : RCC_PLLCFGR_PLLP_Field;
      Reserved_18_19 : A0B.Types.Reserved_2;
      PLLQEN         : Boolean;
      PLLQ           : RCC_PLLCFGR_PLLQ_Field;
      Reserved_23    : A0B.Types.Reserved_1;
      PLLREN         : Boolean;
      PLLR           : RCC_PLLCFGR_PLLR_Field;
      PLLPDIV        : A0B.Types.Unsigned_5;
   end record with Size => 32;

   for RCC_PLLCFGR_Register use record
      PLLSRC         at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      PLLM           at 0 range 4 .. 7;
      PLLN           at 0 range 8 .. 14;
      Reserved_15    at 0 range 15 .. 15;
      PLLPEN         at 0 range 16 .. 16;
      PLLP           at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      PLLQEN         at 0 range 20 .. 20;
      PLLQ           at 0 range 21 .. 22;
      Reserved_23    at 0 range 23 .. 23;
      PLLREN         at 0 range 24 .. 24;
      PLLR           at 0 range 25 .. 26;
      PLLPDIV        at 0 range 27 .. 31;
   end record;

   RCC_CR      : RCC_CR_Register
     with Import, Volatile, Full_Access_Only,
          Address =>
            System.Storage_Elements.To_Address
              (RCC_Base_Address + RCC_CR_Offset);
   RCC_CFGR    : RCC_CFGR_Regiter
     with Import, Volatile, Full_Access_Only,
          Address =>
            System.Storage_Elements.To_Address
              (RCC_Base_Address + RCC_CFGR_Offset);
   RCC_PLLCFGR : RCC_PLLCFGR_Register
     with Import, Volatile, Full_Access_Only,
          Address =>
            System.Storage_Elements.To_Address
              (RCC_Base_Address + RCC_PLLCFGR_Offset);

end A0B.STM32G4.Peripherals.RCC;
