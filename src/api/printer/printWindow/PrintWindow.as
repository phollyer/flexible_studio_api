package api.printer.printWindow
{
	import flash.events.IEventDispatcher;
	import api.printer.Printer;
	
	[Bindable]
	public class PrintWindow extends Printer
	{
		// Optional
		public var center:Boolean = false;
		public var clientOnly:Boolean = false;
		public var fitToPage:Boolean = false;
		public var height:Number = 0;
		public var stretchToFit:Boolean = false;
		public var width:Number = 0;
		public var x:Number = 0;
		public var y:Number = 0;		
		
		public function PrintWindow(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function printWindow():void
		{
			var __o:Object = new Object();
			__o.center = center;
			__o.clientOnly = clientOnly;
			__o.fitToPage = fitToPage;
			__o.stretchToFit = stretchToFit;
			__o.x = x;
			__o.y = y;
			
			switch( height > 0 )
			{
				case true:
					__o.height = height;
			}
			switch( width > 0 )
			{
				case true:
					__o.width = width;
			}
			ssCore.Printer.printWindow( __o
									  ,{callback:actionComplete, errorSTR:"printWindowError", code:"32005"} );
		}
	}
}