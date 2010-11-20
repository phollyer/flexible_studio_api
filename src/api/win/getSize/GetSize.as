package api.win.getSize
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.win.getSize.GetSizeEvent;
	import api.win.Win;
	
	[Event(name="result", type="api.events.win.getSize.GetSizeEvent")]
	[Bindable]
	public class GetSize extends Win
	{
		// Result
		public var height:Number = 0;
		public var width:Number = 0;
		
		public function GetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getSize():void
		{
			ssCore.Win.getSize( {}
							   ,{callback:actionComplete, errorSTR:"getSizeError", code:"6005"} );
		}
		override protected function sendResult( r:Object ):void
		{
			height = Number( r.height );
			width = Number( r.width );
			
			var e : GetSizeEvent = new GetSizeEvent( GetSizeEvent.RESULT );
			e.height = height;
			e.width = width;
			dispatchEvent( e );
		}
	}
}