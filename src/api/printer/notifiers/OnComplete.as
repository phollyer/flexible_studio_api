package api.printer.notifiers
{
	import api.events.printer.notifiers.OnCompleteEvent;

	import api.printer.Printer;

	import flash.events.IEventDispatcher;

	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_onComplete.html Northcode Help Documentation
	*/
	public class OnComplete extends Printer
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Printer.OnComplete()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_onComplete.html Northcode Help Documentation
		*/
		public function OnComplete(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Printer.setNotify( {event:"onComplete"}
									 ,{callback:actionComplete, errorSTR:"onCompleteError", code:"32011"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			
			var e : OnCompleteEvent = new OnCompleteEvent( OnCompleteEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}