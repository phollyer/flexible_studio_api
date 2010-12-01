package api.wmAudio.setVolume
{
	import api.events.wmAudio.setVolume.SetVolumeEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setVolume.html Northcode Help Documentation
	*/
	public class SetVolume extends WmAudio
	{
		// Optional 
		public var volume:Number = -5000;
		
		/**
		* Constructor for WmAudio.SetVolume()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setVolume.html Northcode Help Documentation
		*/
		public function SetVolume(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setVolume.html Northcode Help Documentation
		*/
		public function setVolume():void
		{
			ssCore.WmAudio.setVolume( {volume:volume}
									 ,{callback:actionComplete, errorSTR:"setVolumeError", code:"46010"} );
		}
	}
}