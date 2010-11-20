package api.wmAudio.stop
{
	import api.events.wmAudio.stop.StopEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_stop.html Northcode Help Documentation
	*/
	public class Stop extends WmAudio
	{
		/**
		* Constructor for WmAudio.Stop()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_stop.html Northcode Help Documentation
		*/
		public function Stop(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_stop.html Northcode Help Documentation
		*/
		public function stop():void
		{
			ssCore.WmAudio.stop( {}
								,{callback:actionComplete, errorSTR:"stopError", code:"46011"} );
		}
	}
}