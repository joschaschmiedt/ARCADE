/**************************************************************************
*                                                                         *
* AgtCtl_i.c - Interface IID and CLSID definitions for Microsoft Agent    *
*              Control.                                                   *
*                                                                         *
* Copyright (c) 1996-1999, Microsoft Corp. All rights reserved.           *
*                                                                         *
**************************************************************************/

/* this file contains the actual definitions of */
/* the IIDs and CLSIDs */

/* link this file in with the server and any clients */


/* File created by MIDL compiler version 5.01.0164 */
/* at Tue Sep 15 16:56:03 1998
 */
/* Compiler settings for AgentControl.idl:
    Oicf (OptLev=i2), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )
#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
    unsigned long x;
    unsigned short s1;
    unsigned short s2;
    unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

const IID IID_IAgentCtlRequest = {0x1DAB85C3,0x803A,0x11D0,{0xAC,0x63,0x00,0xC0,0x4F,0xD9,0x75,0x75}};


const IID IID_IAgentCtlUserInput = {0xC4ABF875,0x8100,0x11D0,{0xAC,0x63,0x00,0xC0,0x4F,0xD9,0x75,0x75}};


const IID IID_IAgentCtlBalloon = {0xF5BE8BD3,0x7DE6,0x11D0,{0x91,0xFE,0x00,0xC0,0x4F,0xD7,0x01,0xA5}};


const IID IID_IAgentCtlBalloonEx = {0x822DB1C0,0x8879,0x11d1,{0x9E,0xC6,0x00,0xC0,0x4F,0xD7,0x08,0x1F}};


const IID IID_IAgentCtlCommand = {0xF5BE8BE3,0x7DE6,0x11D0,{0x91,0xFE,0x00,0xC0,0x4F,0xD7,0x01,0xA5}};


const IID IID_IAgentCtlCommandEx = {0xB0913410,0x3B44,0x11d1,{0xAC,0xBA,0x00,0xC0,0x4F,0xD9,0x75,0x75}};


const IID IID_IAgentCtlCommands = {0xF5BE8BE1,0x7DE6,0x11D0,{0x91,0xFE,0x00,0xC0,0x4F,0xD7,0x01,0xA5}};


const IID IID_IAgentCtlCommandsEx = {0x6BA90C01,0x3910,0x11d1,{0xAC,0xB3,0x00,0xC0,0x4F,0xD9,0x75,0x75}};


const IID IID_IAgentCtlCharacter = {0xF5BE8BD9,0x7DE6,0x11D0,{0x91,0xFE,0x00,0xC0,0x4F,0xD7,0x01,0xA5}};


const IID IID_IAgentCtlAnimationNames = {0x8B77181C,0xD3EF,0x11d1,{0x85,0x00,0x00,0xC0,0x4F,0xA3,0x4A,0x14}};


const IID IID_IAgentCtlCharacterEx = {0xDE8EF600,0x2F82,0x11d1,{0xAC,0xAC,0x00,0xC0,0x4F,0xD9,0x75,0x75}};


const IID IID_IAgentCtlCharacters = {0xF5BE8BE8,0x7DE6,0x11D0,{0x91,0xFE,0x00,0xC0,0x4F,0xD7,0x01,0xA5}};


const IID IID_IAgentCtlAudioObject = {0xF5BE8BDB,0x7DE6,0x11D0,{0x91,0xFE,0x00,0xC0,0x4F,0xD7,0x01,0xA5}};


const IID IID_IAgentCtlAudioObjectEx = {0xF5BE8BF0,0x7DE6,0x11D0,{0x91,0xFE,0x00,0xC0,0x4F,0xD7,0x01,0xA5}};


const IID IID_IAgentCtlSpeechInput = {0xF5BE8BDD,0x7DE6,0x11D0,{0x91,0xFE,0x00,0xC0,0x4F,0xD7,0x01,0xA5}};


const IID IID_IAgentCtlPropertySheet = {0xF5BE8BDF,0x7DE6,0x11D0,{0x91,0xFE,0x00,0xC0,0x4F,0xD7,0x01,0xA5}};


const IID IID_IAgentCtlCommandsWindow = {0x6D0ECB27,0x9968,0x11D0,{0xAC,0x6E,0x00,0xC0,0x4F,0xD9,0x75,0x75}};


const IID IID_IAgentCtl = {0xF5BE8BD1,0x7DE6,0x11D0,{0x91,0xFE,0x00,0xC0,0x4F,0xD7,0x01,0xA5}};


const IID IID_IAgentCtlEx = {0x8563FF20,0x8ECC,0x11d1,{0xB9,0xB4,0x00,0xC0,0x4F,0xD9,0x75,0x75}};


const IID LIBID_AgentObjects = {0xF5BE8BC2,0x7DE6,0x11D0,{0x91,0xFE,0x00,0xC0,0x4F,0xD7,0x01,0xA5}};


const IID DIID__AgentEvents = {0xF5BE8BD4,0x7DE6,0x11D0,{0x91,0xFE,0x00,0xC0,0x4F,0xD7,0x01,0xA5}};


const CLSID CLSID_Agent = {0xD45FD31B,0x5C6E,0x11D1,{0x9E,0xC1,0x00,0xC0,0x4F,0xD7,0x08,0x1F}};


#ifdef __cplusplus
}
#endif

