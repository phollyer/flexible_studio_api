package api.win.getClientSize
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.win.getClientSize.GetClientSizeEvent;
	import api.win.Win;
	
	[Event(name="result", type="api.events.win.getClientSize.GetClientSizeEvent")]
	[Bindable]
	public class GetClientSize extends Win
	{
		// Result
		public var height:Number = 0;
		public var width:Number = 0;
		
		public function GetClientSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getClientSize():void
		{
			ssCore.Win.getClientSize( {}
									 ,{callback:actionComplete, errorSTR:"getClientSizeError", code:"6003"} );
		}
		override protected function sendResult( r:Object ):void
		{
			height = Number( r.height );
			width = Number( r.width );
			
			var e : GetClientSizeEvent = new GetClientSizeEvent( GetClientSizeEvent.RESULT );
			e.height = height;
			e.width = width;
			dispatchEvent( e );
		}
	}
}