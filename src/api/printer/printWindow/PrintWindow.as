package api.printer.printWindow
{
	import api.events.printer.printWindow.PrintWindowEvent;

	import api.printer.Printer;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_printWindow.html Northcode Help Documentation
	*/
	public class PrintWindow extends Printer
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var center:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var clientOnly:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var fitToPage:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var height:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var stretchToFit:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var width:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var x:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var y:Number = 0;		
		
		/**
		* Constructor for Printer.PrintWindow()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_printWindow.html Northcode Help Documentation
		*/
		public function PrintWindow(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_printWindow.html Northcode Help Documentation
		*/
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