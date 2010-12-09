package api.wmAudio.setMute
{
	import api.events.wmAudio.setMute.SetMuteEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Temporarily enable or disable sound.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setMute.html Northcode Help Documentation
	*/
	public class SetMute extends WmAudio
	{
		// Optional 
		/**
		* Set the mute flag to TRUE to disable sound and set the flag to false to enable sound again. Muting the sound does not affect the volume setting. Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for WmAudio.SetMute()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setMute.html Northcode Help Documentation
		*/
		public function SetMute(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Temporarily enable or disable sound.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setMute.html Northcode Help Documentation
		*/
		public function setMute():void
		{
			ssCore.WmAudio.setMute( {flag:flag}
								   ,{callback:actionComplete, errorSTR:"setMuteError", code:"46005"} );
		}
	}
}