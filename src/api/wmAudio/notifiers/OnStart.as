package api.wmAudio.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmAudio.notifiers.OnStartEvent;
	import api.wmAudio.WmAudio;
	
	[Event(name="result", type="api.events.wmAudio.onStart.OnStartEvent")]
	[Bindable]
	public class OnStart extends WmAudio
	{		
		// Result
		public var duration:String = null;
		public var height:Number = 0;
		public var width:Number = 0;
		
		public function OnStart(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmAudio.setNotify( {event:"onStart"}
							 	 	 ,{callback:actionComplete, errorSTR:"onStartError", code:"45017"} );
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