--
--  Copyright (C) 2025, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

--  Common definitions for STM32G4xx family [RM0440]

with A0B.ARMv7M;

package A0B.STM32G4.Interrupts
  with Preelaborate, No_Elaboration_Code_All
is

   subtype Interrupt_Number is
     A0B.ARMv7M.External_Interrupt_Number range 0 .. 101;

   WWDG                                  : constant Interrupt_Number := 0;
   PVD_PVM                               : constant Interrupt_Number := 1;
   RTC_TAMP_CSS_LSE                      : constant Interrupt_Number := 2;
   RTC_WKUP                              : constant Interrupt_Number := 3;
   FLASH                                 : constant Interrupt_Number := 4;
   RCC                                   : constant Interrupt_Number := 5;
   EXTI0                                 : constant Interrupt_Number := 6;
   EXTI1                                 : constant Interrupt_Number := 7;
   EXTI2                                 : constant Interrupt_Number := 8;
   EXTI3                                 : constant Interrupt_Number := 9;
   EXTI4                                 : constant Interrupt_Number := 10;
   DMA1_CH1                              : constant Interrupt_Number := 11;
   DMA1_CH2                              : constant Interrupt_Number := 12;
   DMA1_CH3                              : constant Interrupt_Number := 13;
   DMA1_CH4                              : constant Interrupt_Number := 14;
   DMA1_CH5                              : constant Interrupt_Number := 15;
   DMA1_CH6                              : constant Interrupt_Number := 16;
   DMA1_CH7                              : constant Interrupt_Number := 17;
   ADC1_2                                : constant Interrupt_Number := 18;
   USB_HP                                : constant Interrupt_Number := 19;
   USB_LP                                : constant Interrupt_Number := 20;
   FDCAN1_IT0                            : constant Interrupt_Number := 21;
   FDCAN1_IT1                            : constant Interrupt_Number := 22;
   EXTI9_5                               : constant Interrupt_Number := 23;
   TIM1_BRK_TIM15                        : constant Interrupt_Number := 24;
   TIM1_UP_TIM16                         : constant Interrupt_Number := 25;
   TIM1_TRG_COM_TIM17_TIM1_DIR_TIM1_IDX  : constant Interrupt_Number := 26;
   TIM1_CC                               : constant Interrupt_Number := 27;
   TIM2                                  : constant Interrupt_Number := 28;
   TIM3                                  : constant Interrupt_Number := 29;
   TIM4                                  : constant Interrupt_Number := 30;
   I2C1_EV                               : constant Interrupt_Number := 31;
   I2C1_ER                               : constant Interrupt_Number := 32;
   I2C2_EV                               : constant Interrupt_Number := 33;
   I2C2_ER                               : constant Interrupt_Number := 34;
   SPI1                                  : constant Interrupt_Number := 35;
   SPI2                                  : constant Interrupt_Number := 36;
   USART1                                : constant Interrupt_Number := 37;
   USART2                                : constant Interrupt_Number := 38;
   USART3                                : constant Interrupt_Number := 39;
   EXTI15_10                             : constant Interrupt_Number := 40;
   RTC_ALARM                             : constant Interrupt_Number := 41;
   USBWakeUP                             : constant Interrupt_Number := 42;
   TIM8_BRK_TIM8_TERR_TIM8_BRK_TIM8_IERR : constant Interrupt_Number := 43;
   TIM8_UP                               : constant Interrupt_Number := 44;
   TIM8_TRG_COM_TIM8_DIR_TIM8_IDX        : constant Interrupt_Number := 45;
   TIM8_CC                               : constant Interrupt_Number := 46;
   ADC3                                  : constant Interrupt_Number := 47;
   FSMC                                  : constant Interrupt_Number := 48;
   LPTIM1                                : constant Interrupt_Number := 49;
   TIM5                                  : constant Interrupt_Number := 50;
   SPI3                                  : constant Interrupt_Number := 51;
   UART4                                 : constant Interrupt_Number := 52;
   UART5                                 : constant Interrupt_Number := 53;
   TIM6_DACUNDER                         : constant Interrupt_Number := 54;
   TIM7_DACUNDER                         : constant Interrupt_Number := 55;
   DMA2_CH1                              : constant Interrupt_Number := 56;
   DMA2_CH2                              : constant Interrupt_Number := 57;
   DMA2_CH3                              : constant Interrupt_Number := 58;
   DMA2_CH4                              : constant Interrupt_Number := 59;
   DMA2_CH5                              : constant Interrupt_Number := 60;
   ADC4                                  : constant Interrupt_Number := 61;
   ADC5                                  : constant Interrupt_Number := 62;
   UCPD1                                 : constant Interrupt_Number := 63;
   COMP1_2_3                             : constant Interrupt_Number := 64;
   COMP4_5_6                             : constant Interrupt_Number := 65;
   COMP7                                 : constant Interrupt_Number := 66;
   HRTIM_Master_IRQn                     : constant Interrupt_Number := 67;
   HRTIM_TIMA_IRQn                       : constant Interrupt_Number := 68;
   HRTIM_TIMB_IRQn                       : constant Interrupt_Number := 69;
   HRTIM_TIMC_IRQn                       : constant Interrupt_Number := 70;
   HRTIM_TIMD_IRQn                       : constant Interrupt_Number := 71;
   HRTIM_TIME_IRQn                       : constant Interrupt_Number := 72;
   HRTIM_TIM_FLT_IRQn                    : constant Interrupt_Number := 73;
   HRTIM_TIMF_IRQn                       : constant Interrupt_Number := 74;
   CRS                                   : constant Interrupt_Number := 75;
   SAI                                   : constant Interrupt_Number := 76;
   TIM20_BRK_TIM20_TERR_TIM20_IERR       : constant Interrupt_Number := 77;
   TIM20_UP                              : constant Interrupt_Number := 78;
   TIM20_TRG_COM_TIM20_DIR_TIM20_IDX     : constant Interrupt_Number := 79;
   TIM20_CC                              : constant Interrupt_Number := 80;
   FPU                                   : constant Interrupt_Number := 81;
   I2C4_EV                               : constant Interrupt_Number := 82;
   I2C4_ER                               : constant Interrupt_Number := 83;
   SPI4                                  : constant Interrupt_Number := 84;
   AES                                   : constant Interrupt_Number := 85;
   FDCAN2_IT0                            : constant Interrupt_Number := 86;
   FDCAN2_IT1                            : constant Interrupt_Number := 87;
   FDCAN3_IT0                            : constant Interrupt_Number := 88;
   FDCAN3_IT1                            : constant Interrupt_Number := 89;
   RNG                                   : constant Interrupt_Number := 90;
   LPUART                                : constant Interrupt_Number := 91;
   I2C3_EV                               : constant Interrupt_Number := 92;
   I2C3_ER                               : constant Interrupt_Number := 93;
   DMAMUX_OVR                            : constant Interrupt_Number := 94;
   QUADSPI                               : constant Interrupt_Number := 95;
   DMA1_CH8                              : constant Interrupt_Number := 96;
   DMA2_CH6                              : constant Interrupt_Number := 97;
   DMA2_CH7                              : constant Interrupt_Number := 98;
   DMA2_CH8                              : constant Interrupt_Number := 99;
   CORDIC                                : constant Interrupt_Number := 100;
   FMAC                                  : constant Interrupt_Number := 101;

end A0B.STM32G4.Interrupts;
