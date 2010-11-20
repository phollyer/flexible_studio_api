package api.vos.ftp.chmod.members
{
	[Bindable]
	public class OtherVO extends Object
	{
		public var execute:Boolean = false;
		public var read:Boolean = true;
		public var write:Boolean = false;
		public function OtherVO()
		{
			super();
		}
		public function getString():String
		{
			var __val:Number = 0;
			switch( execute )
			{
				case true:
					__val = 1;
			}
			switch( read )
			{
				case true:
					__val += 4;
			}
			switch( write )
			{
				case true:
					__val += 2;
			}
			return String( __val );
		}
	}
}