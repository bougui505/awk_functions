#!/usr/bin/awk
# -*- coding: UTF8 -*-

# Author: Guillaume Bouvier -- guillaume.bouvier@pasteur.fr
# https://research.pasteur.fr/en/member/guillaume-bouvier/
# 2021-05-05 09:40:36 (UTC+0200)

function isnum(x) {
    return(x==x+0)
}

function recfile() {
    # Store the recfile in the REC array whith REC[i] the record i of the recfile
    # usage: BEGIN{recfile()}
    i = 0
    IND = 0
    while(getline < ARGV[1]){
        IND += 1
        if (NF==0 || IND==1){
            i += 1
            REC[i] = ""
        }
        if (NF>0){
            REC[i] = REC[i]"\n"$0
        }
        RECMAP[IND] = i
    }
}

function recprint(LINENUM) {
    # print the recentry for the i-th line
    print REC[RECMAP[LINENUM]]
}
