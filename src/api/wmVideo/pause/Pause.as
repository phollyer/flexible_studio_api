package api.wmVideo.pause
{
	import api.events.wmVideo.pause.PauseEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_pause.html Northcode Help Documentation
	*/
	public class Pause extends WmVideo
	{
		/**
		* Constructor for WmVideo.Pause()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_pause.html Northcode Help Documentation
		*/
		public function Pause(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_pause.html Northcode Help Documentation
		*/
		public function pause():void
		{
			ssCore.WmVideo.pause( {}
								 ,{callback:actionComplete, errorSTR:"pauseError", code:"46002"} );
		}
	}
}