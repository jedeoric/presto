
#include "../oric-common/vars/telemon_vars.inc.asm"
#include "../oric-common/include/asm/telemon.h"
#include "../oric-common/include/asm/macro_orix.h"
; ----------------------------------------------------------------------------

.text
*=$1000-20
	.byt $01,$00		; non-C64 marker like o65 format
	.byt "o", "r", "i"      ; "ori" MAGIC number :$6f, $36, $35 like o65 format
	.byt $01                ; version of this header
cpu_mode
	.byt $00                ; CPU see below for description
language_type
	.byt $00	        ; reserved in the future, it will define if it's a Hyperbasic file, teleass file, forth file 
  .byt $00                ; reserved
  .byt $00		; reserved
  .byt $00	        ; operating system id for telemon $00 means telemon 3.0 version
  .byt $00	        ; reserved
	.byt $00                ; reserved
type_of_file
  .byt %01001001                   ; Auto, direct, data for stratsed, sedoric, ftdos compatibility
  .byt <start_adress,>start_adress ; loading adress
  .byt <EndOfMemory,>EndOfMemory   ; end of loading adress
  .byt <start_adress,>start_adress ; starting adress
 
start_adress
*=$1000

  
  lda    #<str_file
  ldx    #>str_file
  BRK_TELEMON(XOPEN)
  cmp   #$0
  beq read
   
  lda    #<not_found
  ldy    #>not_found
  BRK_TELEMON(XWSTR0)      
  rts

read
  BRK_TELEMON(XHIRES)

loopme
  lda #<$a000
  sta PTR_READ_DEST
  lda #>$a000
  sta PTR_READ_DEST+1	
		
  lda #$40 ; read a frame (6KB)
  ldy #$15
  BRK_TELEMON(XFREAD)

  jmp loopme ; never end but loop all the file
  
  rts

not_found
    .asc "Not found",0
str_file
    .asc "/usr/share/presto/prestoc.vhi"
  
EndOfMemory


