package api.wmVideo.getVersion
{
	import api.events.wmVideo.getVersion.GetVersionEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmVideo.getVersion.GetVersionEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmVideo.getVersion.GetVersionEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_getVersion.html Northcode Help Documentation
	*/
	public class GetVersion extends WmVideo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var version:Number = 0;
		
		/**
		* Constructor for WmVideo.GetVersion()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_getVersion.html Northcode Help Documentation
		*/
		public function GetVersion(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_getVersion.html Northcode Help Documentation
		*/
		public function getVersion():void
		{
			ssCore.WmVideo.getVersion( {}
									  ,{callback:actionComplete, errorSTR:"getVersionError", code:"46001"} );
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