package api.wmAudio.setMute
{
	import api.events.wmAudio.setMute.SetMuteEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setMute.html Northcode Help Documentation
	*/
	public class SetMute extends WmAudio
	{
		// Optional 
		/**
		* 
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
		*
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