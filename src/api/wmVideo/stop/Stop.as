package api.wmVideo.stop
{
	import api.events.wmVideo.stop.StopEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Stop playback of the current resource. You will have to call WMVideo.setResource again after using WMVideo.stop.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_stop.html Northcode Help Documentation
	*/
	public class Stop extends WmVideo
	{
		/**
		* Constructor for WmVideo.Stop()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_stop.html Northcode Help Documentation
		*/
		public function Stop(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Stop playback of the current resource. You will have to call WMVideo.setResource again after using WMVideo.stop.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_stop.html Northcode Help Documentation
		*/
		public function stop():void
		{
			ssCore.WmVideo.stop( {}
								,{callback:actionComplete, errorSTR:"stopError", code:"46018"} );
		}
	}
}