package api.wmAudio.pause
{
	import api.events.wmAudio.pause.PauseEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Temporarily pause playback of the current resource (until WMAudio.resume is called).
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_pause.html Northcode Help Documentation
	*/
	public class Pause extends WmAudio
	{
		/**
		* Constructor for WmAudio.Pause()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_pause.html Northcode Help Documentation
		*/
		public function Pause(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Temporarily pause playback of the current resource (until WMAudio.resume is called).
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_pause.html Northcode Help Documentation
		*/
		public function pause():void
		{
			ssCore.WmAudio.pause( {}
								 ,{callback:actionComplete, errorSTR:"pauseError", code:"45001"} );
		}
	}
}