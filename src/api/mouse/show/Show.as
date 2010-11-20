package api.mouse.show
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.mouse.show.ShowEvent;
	import api.mouse.Mouse;

	[Event(name="result", type="api.events.mouse.show.ShowEvent")]
	[Bindable]
	public class Show extends Mouse
	{
		// Result
		public var displayCounter:Number = 0;
		
		public function Show(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show():void
		{
			ssCore.Mouse.show( {}
							  ,{callback:actionComplete, errorSTR:"showError", code:"29008"} );
		}
		override protected function sendResult( r:Object ):void
		{
			displayCounter = Number( r.result );
			
			var e : ShowEvent = new ShowEvent( ShowEvent.RESULT );
			e.displayCounter = displayCounter;
			dispatchEvent( e );
		}
	}
}