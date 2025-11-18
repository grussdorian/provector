// Entry point for provector extension
extern "C" {  
  #include "postgres.h"
  #include "fmgr.h"
  #include "utils/builtins.h"
  #include "varatt.h"
  #include "c.h"
}

#include <cctype>
#include <cstring>


static void to_title_case(char*str, int32 len) noexcept {
  bool new_word = true;
  for (int32 i=0;i<len; i++){
    unsigned char ch = static_cast<unsigned char>(str[i]);
    if ( std::isspace(ch) || std::ispunct(ch) ) {
      new_word = true;
    } else {
      if (new_word) {
        str[i] = static_cast<char>(std::toupper(ch));
        new_word = false;
      } else {
        str[i] = static_cast<char>(std::tolower(ch));
      }
    }
  }
}

extern "C" {
  PG_MODULE_MAGIC;
  
  PG_FUNCTION_INFO_V1(provector_demo);
  Datum
  provector_demo(PG_FUNCTION_ARGS) {
    text *arg1 = PG_GETARG_TEXT_PP(0);
    int32 arg1_size = VARSIZE_ANY_EXHDR(arg1);
    int32 new_text_size = arg1_size + VARHDRSZ;
    text *new_text = (text*) palloc((Size) new_text_size);
    
    SET_VARSIZE(new_text, new_text_size);
    memcpy(VARDATA(new_text), VARDATA_ANY(arg1), (size_t) arg1_size);
    to_title_case(VARDATA(new_text), arg1_size);
    PG_RETURN_TEXT_P(new_text);
  }
}