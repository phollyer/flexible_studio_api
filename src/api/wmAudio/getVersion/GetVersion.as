package api.wmAudio.getVersion
{
	import api.events.wmAudio.getVersion.GetVersionEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmAudio.getVersion.GetVersionEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmAudio.getVersion.GetVersionEvent")]
	[Bindable]
	/**
	* Get the version of the media player in use.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_getVersion.html Northcode Help Documentation
	*/
	public class GetVersion extends WmAudio
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var version:Number = 0;
		
		/**
		* Constructor for WmAudio.GetVersion()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_getVersion.html Northcode Help Documentation
		*/
		public function GetVersion(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Get the version of the media player in use.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_getVersion.html Northcode Help Documentation
		*/
		public function getVersion():void
		{
			ssCore.WmAudio.getVersion( {}
									  ,{callback:actionComplete, errorSTR:"getVersionError", code:"45000"} );
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
			version = Number( r.result );
			
			var e : GetVersionEvent = new GetVersionEvent( GetVersionEvent.RESULT );
			e.version = version;
			dispatchEvent( e );
		}
	}
}