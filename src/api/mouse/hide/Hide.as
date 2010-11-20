package api.mouse.hide
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.mouse.hide.HideEvent;
	import api.mouse.Mouse;

	[Event(name="result", type="api.events.mouse.hide.HideEvent")]
	[Bindable]
	public class Hide extends Mouse
	{
		// Result
		public var displayCounter:Number = 0;
		
		public function Hide(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function hide():void
		{
			ssCore.Mouse.hide( {}
							  ,{callback:actionComplete, errorSTR:"hideError", code:"29001"} );
		}
		override protected function sendResult( r:Object ):void
		{
			displayCounter = Number( r.result );
			
			var e : HideEvent = new HideEvent( HideEvent.RESULT );
			e.displayCounter = displayCounter;
			dispatchEvent( e );
		}
	}
}