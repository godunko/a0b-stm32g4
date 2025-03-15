--
--  Copyright (C) 2025, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  Common definitions for STM32G4xx family

pragma Ada_2022;

with System.Storage_Elements;

package A0B.STM32G4.Peripherals
  with Pure, No_Elaboration_Code_All
is

   EXTI_Base   : constant System.Address :=
     System.Storage_Elements.To_Address (16#4001_0400#);
   GPIOA_Base  : constant System.Address :=
     System.Storage_Elements.To_Address (16#4800_0000#);
   GPIOB_Base  : constant System.Address :=
     System.Storage_Elements.To_Address (16#4800_0400#);
   GPIOC_Base  : constant System.Address :=
     System.Storage_Elements.To_Address (16#4800_0800#);
   GPIOD_Base  : constant System.Address :=
     System.Storage_Elements.To_Address (16#4800_0C00#);
   GPIOE_Base  : constant System.Address :=
     System.Storage_Elements.To_Address (16#4800_1000#);
   GPIOF_Base  : constant System.Address :=
     System.Storage_Elements.To_Address (16#4800_1400#);
   GPIOG_Base  : constant System.Address :=
     System.Storage_Elements.To_Address (16#4800_1800#);
   SYSCFG_Base : constant System.Address :=
     System.Storage_Elements.To_Address (16#4001_0000#);

end A0B.STM32G4.Peripherals;
