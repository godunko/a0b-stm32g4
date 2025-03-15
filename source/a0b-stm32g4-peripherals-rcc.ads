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

   RCC_Base_Address    : constant := 16#4002_1000#;
   RCC_CR_Offset       : constant := 16#00#;
   RCC_CFGR_Offset     : constant := 16#08#;
   RCC_PLLCFGR_Offset  : constant := 16#0C#;
   RCC_AHB1ENR_Offset  : constant := 16#48#;
   RCC_AHB2ENR_Offset  : constant := 16#4C#;
   RCC_AHB3ENR_Offset  : constant := 16#50#;
   RCC_APB1ENR1_Offset : constant := 16#58#;
   RCC_APB1ENR2_Offset : constant := 16#5C#;
   RCC_APB2ENR_Offset  : constant := 16#60#;
   RCC_CCIPR_Offset    : constant := 16#88#;
   --  FSF GCC 14 is unable to evaluate register's address at compile time
   --  and it use objects for constants allocated in RAM to store registers'
   --  addresses. These constants should be initialized at elaboration, but
   --  elaboration is disabled for this compilation unit. Named constants
   --  for addresses and offsets are used to workaround this issue.

   -----------------
   -- RCC_AHB1ENR --
   -----------------

   type RCC_AHB1ENR_Register is record
      DMA1EN         : Boolean;
      DMA2EN         : Boolean;
      DMAMUX1EN      : Boolean;
      CORDICEN       : Boolean;
      FMACEN         : Boolean;
      Reserved_5_7   : A0B.Types.Reserved_3;
      FLASHEN        : Boolean;
      Reserved_9_11  : A0B.Types.Reserved_3;
      CRCEN          : Boolean;
      Reserved_13_31 : A0B.Types.Reserved_19;
   end record with Size => 32;

   for RCC_AHB1ENR_Register use record
      DMA1EN         at 0 range 0 .. 0;
      DMA2EN         at 0 range 1 .. 1;
      DMAMUX1EN      at 0 range 2 .. 2;
      CORDICEN       at 0 range 3 .. 3;
      FMACEN         at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      FLASHEN        at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      CRCEN          at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   -----------------
   -- RCC_AHB2ENR --
   -----------------

   type RCC_AHB2ENR_Register is record
      GPIOAEN        : Boolean;
      GPIOBEN        : Boolean;
      GPIOCEN        : Boolean;
      GPIODEN        : Boolean;
      GPIOEEN        : Boolean;
      GPIOFEN        : Boolean;
      GPIOGEN        : Boolean;
      Reserved_7_12  : A0B.Types.Reserved_6;
      ADC12EN        : Boolean;
      ADC345EN       : Boolean;
      Reserved_15    : A0B.Types.Reserved_1;
      DAC1EN         : Boolean;
      DAC2EN         : Boolean;
      DAC3EN         : Boolean;
      DAC4EN         : Boolean;
      Reserved_20_23 : A0B.Types.Reserved_4;
      AESEN          : Boolean;
      Reserved_25    : A0B.Types.Reserved_1;
      RNGEN          : Boolean;
      Reserved_27_31 : A0B.Types.Reserved_5;
   end record with Size => 32;

   for RCC_AHB2ENR_Register use record
      GPIOAEN        at 0 range 0 .. 0;
      GPIOBEN        at 0 range 1 .. 1;
      GPIOCEN        at 0 range 2 .. 2;
      GPIODEN        at 0 range 3 .. 3;
      GPIOEEN        at 0 range 4 .. 4;
      GPIOFEN        at 0 range 5 .. 5;
      GPIOGEN        at 0 range 6 .. 6;
      Reserved_7_12  at 0 range 7 .. 12;
      ADC12EN        at 0 range 13 .. 13;
      ADC345EN       at 0 range 14 .. 14;
      Reserved_15    at 0 range 15 .. 15;
      DAC1EN         at 0 range 16 .. 16;
      DAC2EN         at 0 range 17 .. 17;
      DAC3EN         at 0 range 18 .. 18;
      DAC4EN         at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      AESEN          at 0 range 24 .. 24;
      Reserved_25    at 0 range 25 .. 25;
      RNGEN          at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   -----------------
   -- RCC_AHB3ENR --
   -----------------

   type RCC_AHB3ENR_Register is record
      FMCEN         : Boolean;
      Reserved_1_7  : A0B.Types.Reserved_7;
      QSPIEN        : Boolean;
      Reserved_9_31 : A0B.Types.Reserved_23;
   end record with Size => 32;

   for RCC_AHB3ENR_Register use record
      FMCEN         at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      QSPIEN        at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   ------------------
   -- RCC_APB1ENR1 --
   ------------------

   type RCC_APB1ENR1_Register is record
      TIM2EN         : Boolean;
      TIM3EN         : Boolean;
      TIM4EN         : Boolean;
      TIM5EN         : Boolean;
      TIM6EN         : Boolean;
      TIM7EN         : Boolean;
      Reserved_6_7   : A0B.Types.Reserved_2;
      CRSEN          : Boolean;
      Reserved_9     : A0B.Types.Reserved_1;
      RTCAPBEN       : Boolean;
      WWDGEN         : Boolean;
      Reserved_12_13 : A0B.Types.Reserved_2;
      SPI2EN         : Boolean;
      SPI3EN         : Boolean;
      Reserved_16    : A0B.Types.Reserved_1;
      USART2EN       : Boolean;
      USART3EN       : Boolean;
      UART4EN        : Boolean;
      UART5EN        : Boolean;
      I2C1EN         : Boolean;
      I2C2EN         : Boolean;
      USBEN          : Boolean;
      Reserved_24    : A0B.Types.Reserved_1;
      FDCANEN        : Boolean;
      Reserved_26_27 : A0B.Types.Reserved_2;
      PWREN          : Boolean;
      Reserved_29    : A0B.Types.Reserved_1;
      I2C3EN         : Boolean;
      LPTIM1EN       : Boolean;
   end record with Size => 32;

   for RCC_APB1ENR1_Register use record
      TIM2EN         at 0 range 0 .. 0;
      TIM3EN         at 0 range 1 .. 1;
      TIM4EN         at 0 range 2 .. 2;
      TIM5EN         at 0 range 3 .. 3;
      TIM6EN         at 0 range 4 .. 4;
      TIM7EN         at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CRSEN          at 0 range 8 .. 8;
      Reserved_9     at 0 range 9 .. 9;
      RTCAPBEN       at 0 range 10 .. 10;
      WWDGEN         at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      SPI2EN         at 0 range 14 .. 14;
      SPI3EN         at 0 range 15 .. 15;
      Reserved_16    at 0 range 16 .. 16;
      USART2EN       at 0 range 17 .. 17;
      USART3EN       at 0 range 18 .. 18;
      UART4EN        at 0 range 19 .. 19;
      UART5EN        at 0 range 20 .. 20;
      I2C1EN         at 0 range 21 .. 21;
      I2C2EN         at 0 range 22 .. 22;
      USBEN          at 0 range 23 .. 23;
      Reserved_24    at 0 range 24 .. 24;
      FDCANEN        at 0 range 25 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      PWREN          at 0 range 28 .. 28;
      Reserved_29    at 0 range 29 .. 29;
      I2C3EN         at 0 range 30 .. 30;
      LPTIM1EN       at 0 range 31 .. 31;
   end record;

   ------------------
   -- RCC_APB1ENR2 --
   ------------------

   type RCC_APB1ENR2_Register is record
      LPUART1EN     : Boolean;
      I2C4EN        : Boolean;
      Reserved_2_7  : A0B.Types.Reserved_6;
      UCPD1EN       : Boolean;
      Reserved_9_31 : A0B.Types.Reserved_23;
   end record with Size => 32;

   for RCC_APB1ENR2_Register use record
      LPUART1EN     at 0 range 0 .. 0;
      I2C4EN        at 0 range 1 .. 1;
      Reserved_2_7  at 0 range 2 .. 7;
      UCPD1EN       at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -----------------
   -- RCC_APB2ENR --
   -----------------

   type RCC_APB2ENR_Register is record
      SYSCFGEN       : Boolean;
      Reserved_1_10  : A0B.Types.Reserved_10;
      TIM1EN         : Boolean;
      SPI1EN         : Boolean;
      TIM8EN         : Boolean;
      USART1EN       : Boolean;
      SPI4EN         : Boolean;
      TIM15EN        : Boolean;
      TIM16EN        : Boolean;
      TIM17EN        : Boolean;
      Reserved_19    : A0B.Types.Reserved_1;
      TIM20EN        : Boolean;
      SAI1EN         : Boolean;
      Reserved_22_25 : A0B.Types.Reserved_4;
      HRTIM1EN       : Boolean;
      Reserved_27_31 : A0B.Types.Reserved_5;
   end record with Size => 32;

   for RCC_APB2ENR_Register use record
      SYSCFGEN       at 0 range 0 .. 0;
      Reserved_1_10  at 0 range 1 .. 10;
      TIM1EN         at 0 range 11 .. 11;
      SPI1EN         at 0 range 12 .. 12;
      TIM8EN         at 0 range 13 .. 13;
      USART1EN       at 0 range 14 .. 14;
      SPI4EN         at 0 range 15 .. 15;
      TIM15EN        at 0 range 16 .. 16;
      TIM16EN        at 0 range 17 .. 17;
      TIM17EN        at 0 range 18 .. 18;
      Reserved_19    at 0 range 19 .. 19;
      TIM20EN        at 0 range 20 .. 20;
      SAI1EN         at 0 range 21 .. 21;
      Reserved_22_25 at 0 range 22 .. 25;
      HRTIM1EN       at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   ---------------
   -- RCC_CCIPR --
   ---------------

   type RCC_CCIPR_USART1SEL_Field is (PCLK, SYSCLK, HSI16, LSE) with Size => 2;

   type RCC_CCIPR_USART2SEL_Field is (PCLK, SYSCLK, HSI16, LSE) with Size => 2;

   type RCC_CCIPR_USART3SEL_Field is (PCLK, SYSCLK, HSI16, LSE) with Size => 2;

   type RCC_CCIPR_UART4SEL_Field is (PCLK, SYSCLK, HSI16, LSE) with Size => 2;

   type RCC_CCIPR_UART5SEL_Field is (PCLK, SYSCLK, HSI16, LSE) with Size => 2;

   type RCC_CCIPR_LPUART1SEL_Field is (PCLK, SYSCLK, HSI16, LSE)
     with Size => 2;

   type RCC_CCIPR_I2C1SEL_Field is (PCLK, SYSCLK, HSI16, Reserved_11)
     with Size => 2;

   type RCC_CCIPR_I2C2SEL_Field is (PCLK, SYSCLK, HSI16, Reserved_11)
     with Size => 2;

   type RCC_CCIPR_I2C3SEL_Field is (PCLK, SYSCLK, HSI16, Reserved_11)
     with Size => 2;

   type RCC_CCIPR_LPTIM1SEL_Field is (PCLK, SYSCLK, HSI16, LSE) with Size => 2;

   type RCC_CCIPR_SAI1SEL_Field is (SYSCLK, PLL_Q, I2S_CKIN, HSI16)
     with Size => 2;

   type RCC_CCIPR_I2S23SEL_Field is (SYSCLK, PLL_Q, I2S_CKIN, HSI16)
     with Size => 2;

   type RCC_CCIPR_FDCANSEL_Field is (HSE, PLL_Q, PCLK, Reserved_11)
     with Size => 2;

   type RCC_CCIPR_CLK48SEL_Field is (HSI48, Reserved_01, PLL_Q, Reserved_11)
     with Size => 2;

   type RCC_CCIPR_ADC12SEL_Field is (No, PLL_P, SYSCLK, Reserved_11)
     with Size => 2;

   type RCC_CCIPR_ADC345SEL_Field is (No, PLL_P, SYSCLK, Reserved_11)
     with Size => 2;

   type RCC_CCIPR_Register is record
      USART1SEL  : RCC_CCIPR_USART1SEL_Field;
      USART2SEL  : RCC_CCIPR_USART2SEL_Field;
      USART3SEL  : RCC_CCIPR_USART3SEL_Field;
      UART4SEL   : RCC_CCIPR_UART4SEL_Field;
      UART5SEL   : RCC_CCIPR_UART5SEL_Field;
      LPUART1SEL : RCC_CCIPR_LPUART1SEL_Field;
      I2C1SEL    : RCC_CCIPR_I2C1SEL_Field;
      I2C2SEL    : RCC_CCIPR_I2C2SEL_Field;
      I2C3SEL    : RCC_CCIPR_I2C3SEL_Field;
      LPTIM1SEL  : RCC_CCIPR_LPTIM1SEL_Field;
      SAI1SEL    : RCC_CCIPR_SAI1SEL_Field;
      I2S23SEL   : RCC_CCIPR_I2S23SEL_Field;
      FDCANSEL   : RCC_CCIPR_FDCANSEL_Field;
      CLK48SEL   : RCC_CCIPR_CLK48SEL_Field;
      ADC12SEL   : RCC_CCIPR_ADC12SEL_Field;
      ADC345SEL  : RCC_CCIPR_ADC345SEL_Field;
   end record with Size => 32;

   for RCC_CCIPR_Register use record
      USART1SEL  at 0 range 0 .. 1;
      USART2SEL  at 0 range 2 .. 3;
      USART3SEL  at 0 range 4 .. 5;
      UART4SEL   at 0 range 6 .. 7;
      UART5SEL   at 0 range 8 .. 9;
      LPUART1SEL at 0 range 10 .. 11;
      I2C1SEL    at 0 range 12 .. 13;
      I2C2SEL    at 0 range 14 .. 15;
      I2C3SEL    at 0 range 16 .. 17;
      LPTIM1SEL  at 0 range 18 .. 19;
      SAI1SEL    at 0 range 20 .. 21;
      I2S23SEL   at 0 range 22 .. 23;
      FDCANSEL   at 0 range 24 .. 25;
      CLK48SEL   at 0 range 26 .. 27;
      ADC12SEL   at 0 range 28 .. 29;
      ADC345SEL  at 0 range 30 .. 31;
   end record;

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

   use System.Storage_Elements;

   RCC_CR       : RCC_CR_Register
     with Import, Volatile,
          Address => To_Address (RCC_Base_Address + RCC_CR_Offset);
   RCC_CFGR     : RCC_CFGR_Regiter
     with Import, Volatile,
          Address => To_Address (RCC_Base_Address + RCC_CFGR_Offset);
   RCC_PLLCFGR  : RCC_PLLCFGR_Register
     with Import, Volatile,
          Address => To_Address (RCC_Base_Address + RCC_PLLCFGR_Offset);
   RCC_AHB1ENR  : RCC_AHB1ENR_Register
     with Import, Volatile,
          Address => To_Address (RCC_Base_Address + RCC_AHB1ENR_Offset);
   RCC_AHB2ENR  : RCC_AHB2ENR_Register
     with Import, Volatile,
          Address => To_Address (RCC_Base_Address + RCC_AHB2ENR_Offset);
   RCC_AHB3ENR  : RCC_AHB3ENR_Register
     with Import, Volatile,
          Address => To_Address (RCC_Base_Address + RCC_AHB3ENR_Offset);
   RCC_APB1ENR1 : RCC_APB1ENR1_Register
     with Import, Volatile,
          Address => To_Address (RCC_Base_Address + RCC_APB1ENR1_Offset);
   RCC_APB1ENR2 : RCC_APB1ENR2_Register
     with Import, Volatile,
          Address => To_Address (RCC_Base_Address + RCC_APB1ENR2_Offset);
   RCC_APB2ENR  : RCC_APB2ENR_Register
     with Import, Volatile,
          Address => To_Address (RCC_Base_Address + RCC_APB2ENR_Offset);
   RCC_CCIPR    : RCC_CCIPR_Register
     with Import, Volatile,
          Address => To_Address (RCC_Base_Address + RCC_CCIPR_Offset);

end A0B.STM32G4.Peripherals.RCC;
