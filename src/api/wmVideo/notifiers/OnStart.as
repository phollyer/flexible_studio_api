package api.wmVideo.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmVideo.notifiers.OnStartEvent;
	import api.wmVideo.WmVideo;
	
	[Event(name="result", type="api.events.wmVideo.onStart.OnStartEvent")]
	[Bindable]
	public class OnStart extends WmVideo
	{		
		// Result
		public var duration:String = null;
		public var height:Number = 0;
		public var width:Number = 0;
		
		public function OnStart(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmVideo.setNotify( {event:"onStart"}
							 	 	 ,{callback:actionComplete, errorSTR:"onStartError", code:"46024"} );
		}
		override protected function sendResult( r:Object ):void
		{
			duration = r.result.split( COMMA )[ 0 ];
			width = Number( r.result.split( COMMA )[ 1 ] );
			height = Number( r.result.split( COMMA )[ 2 ] );
			
			var e : OnStartEvent = new OnStartEvent( OnStartEvent.RESULT );
			e.duration = duration;
			e.height = height;
			e.width = width;
			dispatchEvent( e );
		}
	}
}