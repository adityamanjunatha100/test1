*******************************************************
* Advanced Digital IC Design                          *
*                                                     *
* Exercise: Phase/Frequency Detector                  *
*******************************************************

***********************************
* TOP Circuit                     *
***********************************
.SUBCKT PFD IN FB flagu flagd
    XDFFIN IN VDD RN QN1 QU DFFRX4
    XDFFFB FB VDD RN QN2 QD DFFRX4
    XR1 QU QD  Y1 NAND2X1
    XR2 Y1 VDD RN AND2X1

    XINV1  QU QUI INVX2
    XBUF1 QUI QUI BUFX1

    XINV2  QD QDI INVX2
    XBUF2 QDI QDI BUFX1

    XND1  QU QDI OUTU NAND2X1
    XND2  QD QUI OUTD NAND2X1

    XDPA1 OUTU OUTBU DPA
    XDPA2 OUTD OUTBD DPA

    XDFFU IN VDD OUTBU QN3 flagu DFFRX4
    XDFFD FB VDD OUTBD QN4 flagd DFFRX4
.ENDS PFD

***********************************
* Subckt Definition               *
***********************************
.SUBCKT DPA INPUT OUTPUT
    XAND0 INPUT INPUT Y0      AND2X1
    XAND1 Y0    INPUT Y1      AND2X1
    XAND2 Y1    Y0    Y2      AND2X1
    XAND3 Y2    Y1    Y3      AND2X1
    XAND4 Y3    Y2    Y4      AND2X1
    XAND5 Y4    Y3    OUTPUT  AND2X1
.ENDS DPA

.END
