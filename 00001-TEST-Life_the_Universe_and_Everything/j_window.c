#include <stdio.h>
#include <stdlib.h>
#include <japi.h>

int main()
{
    /* graphical Objects */
    int frame,obj;
    int window,label,released,pressed;
    int x,y,fx,fy;
    char message[256];


    if(!j_start())
        printf("can't connect to server\n"),exit(0);

    /* Generate Graphic Objects */
    frame     = j_frame("Windows Demo");

    window  = j_window(frame);
    j_setflowlayout(window,J_HORIZONTAL);
    label   = j_label(window,"");
    j_setnamedcolorbg(label,J_YELLOW);

    pressed  = j_mouselistener(frame,J_PRESSED);
    released = j_mouselistener(frame,J_RELEASED);

    j_show(frame);

    while(1)
    {
        obj=j_nextaction();
printf("%d %d\n",obj,frame);

	if(obj == pressed)
        {
            j_getpos(frame,&fx,&fy);
            printf("Framepos = %d:%d\n",fx,fy);
            j_getmousepos(pressed,&x,&y);
            sprintf(message,"Mouse pressed at %d:%d",x,y);
            j_settext(label,message);
            j_setpos(window,fx+x,fy+y);
//            j_setpos(window,fx,fy);
            j_pack(window);
            j_show(window);
        }

        if(obj==released)
            j_hide(window);

        if(obj == frame)
        {
            j_quit();
            break;
        }
    }

    exit(0);
}


