// Entry point for provector extension

#include "postgres.h"
#include "utils/builtins.h"
#include "c.h"
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "fmgr.h"
#include "varatt.h"

static void to_title_case(char*str, int32 len){
  int new_word = 1;
  int i;
  for (i=0;i<len; i++){
    if (isspace(str[i]) || ispunct(str[i])){
      new_word = 1;
      str[i] = str[i];
    } else {
      if (new_word) {
        str[i] = toupper(str[i]);
        new_word = 0;
      } else {
        str[i] = tolower(str[i]);
      }
    }
  }
}

PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(provector_demo);
Datum
provector_demo(PG_FUNCTION_ARGS) {
    text *arg1 = PG_GETARG_TEXT_PP(0);
    int32 arg1_size = VARSIZE_ANY_EXHDR(arg1);
    int32 new_text_size = arg1_size + VARHDRSZ;
    text *new_text = (text*) palloc(new_text_size);
  
    SET_VARSIZE(new_text, new_text_size);
    memcpy(VARDATA(new_text), VARDATA_ANY(arg1), arg1_size);
    to_title_case(VARDATA(new_text), arg1_size);
    PG_RETURN_TEXT_P(new_text);
}