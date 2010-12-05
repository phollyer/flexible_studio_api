package api.wmAudio.play
{
	import api.events.wmAudio.play.PlayEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Play the currently selected resource.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_play.html Northcode Help Documentation
	*/
	public class Play extends WmAudio
	{
		/**
		* Constructor for WmAudio.Play()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_play.html Northcode Help Documentation
		*/
		public function Play(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Play the currently selected resource.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_play.html Northcode Help Documentation
		*/
		public function play():void
		{
			ssCore.WmAudio.play( {}
								,{callback:actionComplete, errorSTR:"playError", code:"46002"} );
		}
	}
}