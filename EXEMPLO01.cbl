      *----------------------------------------------------------------*
      * PROGRAMA: EXEMPLO1
      * AUTHOR  : EMANUEL
      * DATA    : 06.02.2023
      *----------------------------------------------------------------*
      * OBJETIVO: CALCULAR O VALOR A RECEBER DE DIVERSOS FUNCIONARIOS
      *           COM BASE NA QTD DE HORAS TRABALHADAS, COM SALARIO FIXO
      *           DE R$ 25,00 POR HORA.
      *   
      *----------------------------------------------------------------*
      
      *----------------------------------------------------------------* 
       IDENTIFICATION                      DIVISION.
      *----------------------------------------------------------------*
       PROGRAM-ID.                         EXEMPLO01.
       AUTHOR.                             EMANUEL.
      *----------------------------------------------------------------*
       ENVIRONMENT                         DIVISION.
      *----------------------------------------------------------------*
       CONFIGURATION                       SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *----------------------------------------------------------------* 
       DATA                                DIVISION.
      *----------------------------------------------------------------* 
       WORKING-STORAGE                     SECTION.
       77  QTDHRSTRAB                      PIC 9(04).
       77  CONTFUNC                        PIC 9(05).
       77  SOMASAL                         PIC 9(12)V99.
       77  SALARIO                         PIC 9(06)V99.
      *----------------------------------------------------------------*
       PROCEDURE                           DIVISION.
      *----------------------------------------------------------------*
       0000-PRINCIPAL.

           PERFORM 1000-INICIALIZAR.
           PERFORM 2000-PROCESSAR UNTIL QTDHRSTRAB = 0
           PERFORM 3000-TERMINO
           STOP RUN
           .

      *----------------------------------------------------------------* 
      *                   Inicializar o Programa                            
      *----------------------------------------------------------------*
       1000-INICIALIZAR.
           MOVE ZERO                       TO CONTFUNC
           MOVE ZERO                       TO SOMASAL
           PERFORM 1500-LER-SYSIN
           .

       1500-LER-SYSIN.
           ACCEPT QTDHRSTRAB               FROM SYSIN
           IF QTDHRSTRAB NOT = ZERO
              COMPUTE CONTFUNC = CONTFUNC + 1
           END-IF
           .

       2000-PROCESSAR.
           COMPUTE SALARIO = QTDHRSTRAB * 25
           COMPUTE SOMASAL = SOMASAL + SALARIO
           DISPLAY "***************************************************"
           DISPLAY "FUNCIONARIO........: " CONTFUNC
           DISPLAY "QTDE. HORAS TRAB...: " QTDHRSTRAB
           DISPLAY "***************************************************"
           PERFORM 1500-LER-SYSIN
           .

       3000-TERMINO.
           DISPLAY " TOTAL DE FUNCIONARIOS LIDOS.: " CONTFUNC
           DISPLAY " SOMA DOS SALARIOS A PAGAR...: " SOMASAL
           DISPLAY "*-------------------------------------------------*"
           DISPLAY "*               TERMINO NORMAL                    *"
           DISPLAY "*-------------------------------------------------*"
           .

      *----------------------------------------------------------------*
       