INLOOP  TD    INDEV   // 測試輸入裝置
        JEQ   INLOOP  // 迴圈直到輸入裝置準備好
	JSUB  READ
        LDA   COUNT
        SUB   ONE
        STA   COUNT
	JSUB  WRITE
.
.
READ	LDX   ZREO
RLOOP	RD    INDEV
        STCH  DATA, X 	// 把A暫存器的字元存入DATA
	LDA   COUNT
	ADD   ONE
        STA   COUNT
        LDCH  DATA, X
        COMP  ENDSS
        STX   INDEX
        LDA   INDEX
        ADD   ONE
        STA   INDEX
        LDX   INDEX
        JGT   RLOOP
        RSUB
.
.
WRITE	LDX  ZZ
WLOOP   LDCH DATA, X
	COMP LOWER
	JGT  W
	ADD  UTL
W	WD   OUTDEV
	TIX  COUNT
	JLT  WLOOP
	RSUB
.
.
.
.
INDEV  BYTE X'F1'   // 輸入裝置代號F1
OUTDEV BYTE X'05'   // 輸出裝置代號05
DATA   RESB 10
ZREO   WORD 0
FIVE   WORD 5
LOWER  WORD 96
UTL    WORD 32
COUNT  WORD 0
ONE    WORD 1
ENDSS  WORD 36
INDEX  WORD 0
ZZ     WORD 0
