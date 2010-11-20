package api.wmVideo.notifiers
{
	import api.events.wmVideo.notifiers.OnStartEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmVideo.notifiers.OnStartEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmVideo.onStart.OnStartEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_onStart.html Northcode Help Documentation
	*/
	public class OnStart extends WmVideo
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var duration:String = null;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var height:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var width:Number = 0;
		
		/**
		* Constructor for WmVideo.OnStart()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_onStart.html Northcode Help Documentation
		*/
		public function OnStart(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmVideo.setNotify( {event:"onStart"}
							 	 	 ,{callback:actionComplete, errorSTR:"onStartError", code:"46024"} );
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