package api.ftp.open
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.ftp.open.OpenEvent;
	import api.ftp.Ftp;

	[Event(name="result", type="api.events.ftp.open.OpenEvent")]
	[Bindable]
	public class Open extends Ftp
	{
		public static const CLOSED:String = "closed";
		public static const OPEN:String = "open";
		
		// Result
		public var isOpen:Boolean = false;
		public var status:String = CLOSED;
		
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function open():void
		{
			ssCore.Ftp.open( {}
							,{callback:actionComplete, errorSTR:"openError", code:"7019"} );
		}
		override protected function sendResult( r:Object ):void
		{
			isOpen = true;
			status = OPEN;
			
			var e : OpenEvent = new OpenEvent( OpenEvent.RESULT );
			e.isOpen = isOpen;
			e.status = status;
			dispatchEvent( e );
		}
	}
}