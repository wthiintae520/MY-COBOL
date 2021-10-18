      ******************************************************************
      * Author: Yunting Yin
      * Date: October 15th, 2021
      * Purpose: Student recording system
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROJECT-1.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-RECORDS-FILE-IN
           ASSIGN TO "F:\STUDENT-RECORDS.TXT"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-RECORDS-FILE-IN.
       01 STUDENT-RECORD-IN.
           05 STUDENT-NUMBER PIC 9(6).
           05 TUITION-OWED PIC 9(6).
           05 STUDENT-NAME PIC X(30).

       WORKING-STORAGE SECTION.
       01 CONTROL-FIELDS.
           05 INPUT-RECORD-FLAG PIC X(3).

       PROCEDURE DIVISION.
       PRODUCE-STUDENT-RECORD-FILE.
           PERFORM INITIATE-STUDENT-RECORD.
           PERFORM PRODUCE-STUDENT-RECORD
           UNTIL INPUT-RECORD-FLAG = 'NO'.
           PERFORM CLOSE-STUDENT-RECORD-FILE.
           STOP RUN.
       INITIATE-STUDENT-RECORD.
           PERFORM OPEN-STUDENT-RECORD-FILE.
           PERFORM PROMPT-FOR-INPUT-STUDENT-RECORD.
       OPEN-STUDENT-RECORD-FILE.
           OPEN OUTPUT STUDENT-RECORDS-FILE-IN.
       PROMPT-FOR-INPUT-STUDENT-RECORD.
           DISPLAY "Do you want to input student record? ".
           ACCEPT INPUT-RECORD-FLAG.
       PRODUCE-STUDENT-RECORD.
           PERFORM PROMPT-FOR-STUDENT-NUMBER.
           PERFORM PROMPT-FOR-TUITION-OWED.
           PERFORM PROMPT-FOR-STUDENT-NAME.
           PERFORM WRITE-STUDENT-RECORD-IN.
           PERFORM PROMPT-FOR-INPUT-STUDENT-RECORD.
       PROMPT-FOR-STUDENT-NUMBER.
           DISPLAY "Enter student number(6 numbers): ".
           ACCEPT STUDENT-NUMBER.
       PROMPT-FOR-TUITION-OWED.
           DISPLAY "Enter tuition owed($): ".
           ACCEPT TUITION-OWED.
       PROMPT-FOR-STUDENT-NAME.
           DISPLAY "Enter student name: ".
           ACCEPT STUDENT-NAME.
       WRITE-STUDENT-RECORD-IN.
           WRITE STUDENT-RECORD-IN.
       CLOSE-STUDENT-RECORD-FILE.
           CLOSE STUDENT-RECORDS-FILE-IN.
       END PROGRAM PROJECT-1.
