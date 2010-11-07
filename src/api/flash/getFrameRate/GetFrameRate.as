package api.flash.getFrameRate
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.flash.getFrameRate.GetFrameRateEvent;
	import api.flash.Flash;

	[Event(name="result", type="api.events.flash.getFrameRate.GetFrameRateEvent")]
	[Bindable]
	public class GetFrameRate extends Flash
	{
		// Optional
		public var path:String = null;
		
		// Result
		public var frameRate:Number = 0;	
		
		public function GetFrameRate(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getFrameRate():void
		{
			switch( path )
			{
				case null:
					ssCore.Flash.getFrameRate( {}
											  ,{callback:actionComplete, errorSTR:"getFrameRateError", code:"21003"} );
					break;
				default:
					ssCore.Flash.getFrameRate( {path:path}
											  ,{callback:actionComplete, errorSTR:"getFrameRateError", code:"21003"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			frameRate = Number( r.result );
			
			var e : GetFrameRateEvent = new GetFrameRateEvent( GetFrameRateEvent.RESULT );
			e.frameRate = frameRate;
			dispatchEvent( e );
		}
	}
}